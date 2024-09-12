<?php

namespace app\api\middle\finance\book;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserLevelDict;
use app\admin\model\user\UserTeam;
use app\api\library\Sign;
use Closure;
use tools\service\Middleware;

class CarBDistribution implements Middleware {


    public function handle($request, Closure $next)
    {

        $template = $request['template'];
        $cash_order = $request['cash_order'];
        $details= json_decode($cash_order['details'],true);
        //找出所有上级,按照先后顺序,这里由于事务问题,没有提交,无法查询
        // $user_team = model(UserTeam::class)->getByUserId($cash_order['user_id']);
        $user_team = $details['user_team'];
        $path = $user_team['path'];

        $teams = model(UserInfo::class)
            ->whereIn('user_id',$path)
            ->orderRaw("field(user_id,$path) desc")
            ->select();

        //先算三级的分润
        $level_dict = model(UserLevelDict::class)->where('level_key','user_level')->select();
        $dict = [
            'U1010' =>$this->getDict($level_dict,'U1010'),
            'U1020' =>$this->getDict($level_dict,'U1020'),
            'U1030' =>$this->getDict($level_dict,'U1030'),
        ];
        $promotion_reward = $this->calcPromotionReward($teams,$cash_order['amount'],$dict);
        //然后挨个计算服务奖
        $service_reward = $this->calcServiceReward($promotion_reward,$teams,$dict);
        //还要计算管理奖,根据用户的agent_level 来计算
        $manage_reward = $this->calcManageReward($teams,$cash_order['amount']);
        //生成记账流水
        $custom_books = $this->makeBookOrder($teams,$request,$promotion_reward,$service_reward,$manage_reward);
        $request['custom_books'] = $custom_books;
        return $next($request);
    }


    private function makeBookOrder ($teams,$request,$promotion_reward,$service_reward,$manage_reward){
        $template = $request['template'];
        $cash_order = $request['cash_order'];
        $teams_info =[];
        foreach($teams as $value){
            $user_id = $value['user_id'];
            $teams_info[$user_id]['user_id'] = $user_id;
            $teams_info[$user_id]['user_name'] = $value['user_name']; 
            $teams_info[$user_id]['login_name'] = $value['login_name'];
            $teams_info[$user_id]['user_level']=$value['user_level'];
            $teams_info[$user_id]['agent_level']=$value['agent_level'];

            $teams_info[$user_id]['cash_amount']=$cash_order['amount'];
            $teams_info[$user_id]['amount'] = 
            $this->calcAmount($user_id,$promotion_reward,$service_reward,$manage_reward); 
        }
        $custom_books = [];
        foreach($teams_info as $k=>$value){
            $order = new FinanceBookOrder();
            $order['book_title'] = $template['book_title'];
            $order['account_id'] = '1';
            $order['batch_id'] = $cash_order['id'];

            $order['book_code'] = $template['book_code'];
            $order['account_type'] = $template['account_type'];
            $order['account_object'] = $template['account_object'];
            $order['book_category'] = $template['book_category'];
            $order['user_name'] = $value['user_name'];
            $order['process_id'] = $value['user_id'];
            $order['debit_amount'] = $this->getDebitAmount($template,$value);
            $order['credit_amount'] = $this->getCreditAmount($template,$value);
            $order['direction'] = $template['direction'];

            $remark = sprintf('推荐:%u,服务:%u,管理:%u',$value['amount']['promotion'],$value['amount']['service'],$value['amount']['manage']);
            $order['remark'] = $remark;
            $order['sign'] = Sign::makeBookSign($order);
            $order['status'] = '10';
            $custom_books[] = $order;

        }
        return $custom_books;
    }


    private function getDebitAmount($template,$value){
        $direction = config('site.finance_book_direction')['debit'];
        if($template['direction'] == $direction){
            return $value['amount']['amount'];
        }
        return 0;
    }
    private function getCreditAmount($template,$value){
        $direction = config('site.finance_book_direction')['credit'];
        if($template['direction'] == $direction){
            return $value['amount']['amount'];
        }
        return 0;
    }
    private function calcAmount($user_id,$promotion_reward,$service_reward,$manage_reward){
        //推广费
        $amount=0;
        $promotion= 0;
        $service = 0;
        $manage = 0;
        foreach($promotion_reward as $value){
            if($value){
                if($value['user_info']['user_id'] == $user_id){
                    $promotion = money()->add($promotion,$value['promotion']);
                }
            }
        }
        //服务费累加
        foreach($service_reward as $rewards){
            if($rewards) {
                foreach($rewards as $value){
                    if($value['user_info']['user_id'] == $user_id){
                        $service = money()->add($service,$value['service']);  
                    }
                }
            }
        }
        //管理费累加
        foreach($manage_reward as $value){
            if($value){
                if($value['user_info']['user_id'] == $user_id){
                    $manage = money()->add($manage,$value['manage']);
                } 
            }
        }


        $amount = money()->add($promotion,$service);
        $amount = money()->add($amount,$manage);
        $ret =  [
            'amount' => $amount,
            'promotion' => $promotion,
            'service' => $service,
            'manage' =>$manage
        ];
        return $ret;
    }

    //计算推荐奖
    public function calcPromotionReward($teams,$amount,$dict){
        $level = "U1010";
        $data = [
            "U1010" =>[],
            "U1020" =>[],
            'U1030' =>[]
        ];
        $assign = 0;
        foreach($teams as $value){
            //如果当前用户等级为U1000
            if($value['user_level'] == "U1010"){
                //如果当前用户等级大于等于 当前全局等级
                if(!money()->levelGt($level,$value['user_level'])){
                    //把需要的钱计算出来
                    $money = money()->mul($amount,$dict['U1010']['promotion_reward']);
                    $data['U1010']['user_info'] = $value;
                    $data['U1010']['promotion'] = money()->sub($money,$assign);
                    $assign = $money;
                    //下一个等级
                    $level = 'U1020';
                }
            }else if($value['user_level'] == 'U1020'){
                if(!money()->levelGt($level,$value['user_level'])){
                    $money = money()->mul($amount,$dict['U1020']['promotion_reward']);
                    $data['U1020']['user_info'] = $value;
                    $data['U1020']['promotion'] = money()->sub($money,$assign);
                    $assign = $money;
                    $level = 'U1030';
                }
            }else if ($value['user_level'] == 'U1030'){
                if(!money()->levelGt($level,$value['user_level'])){
                    $money = money()->mul($amount,$dict['U1030']['promotion_reward']);
                    $data['U1030']['user_info'] = $value;
                    $data['U1030']['promotion'] = money()->sub($money,$assign);
                    $assign = $money;
                    $level = 'U1040';
                }
            }
        }
        return $data;

    }

    public function calcServiceReward($promotion_reward,$teams,$dict){
        //如果1010有收益,那么他之上的所有用户都有服务费
        $ret = [];
        $levels = ["U1010","U1020","U1030"];
        foreach($levels as $level){
            $ret[$level] = $this->getServiceReward($promotion_reward[$level],$teams,$dict[$level]);
        }
        return $ret;

    }
    private function getServiceReward($promotion_reward,$teams,$dict)
    {
        if(empty($promotion_reward['user_info'])){
            return;
        }
        $user_info = $promotion_reward['user_info'];
        $start = false;
        $money=0; 
        $ret = [];
        foreach($teams as $value)
        {
            if($start)
            {
                $m = money()->mul($money,$dict['service_reward']);
                //保证金额>1
                if(money()->gte($m,1)){
                    $ret[$value['user_id']]['user_info'] = $value;
                    $ret[$value['user_id']]['service'] = $m;
                    $money = $m;
                }
            }
            if($value['user_id'] == $user_info['user_id']){
                //找到用户才开始记录
                $money = $promotion_reward['promotion'];
                $start = true;
            }

        }
        return $ret;

    }
    //计算管理奖
    private function calcManageReward($teams,$amount){
        $level_dict = model(UserLevelDict::class)->where('level_key','agent_level')->select();
        $dict = [
            'A1010' =>$this->getDict($level_dict,'A1010'),
            'A1020' =>$this->getDict($level_dict,'A1020'),
            'A1030' =>$this->getDict($level_dict,'A1030'),
        ];
        //初始等级
        $level = "A1010"; 
        $data = [
            "A1010" =>[],
            "A1020" =>[],
            'A1030' =>[]
        ];
        //初始分配额度
        $assign = 0;

        foreach($teams as $value){
            if($value['agent_level'] == 'A1010'){
                if(!money()->levelGt($level,$value['agent_level'])){
                    $money = money()->mul($amount,$dict['A1010']['service_reward']);
                    $data['A1010']['user_info'] = $value;
                    $data['A1010']['manage'] = money()->sub($money,$assign);
                    $assign = $money;
                    //下一个等级
                    $level = 'A1020';
                }
            }elseif($value['agent_level'] == 'A1020'){
                if(!money()->levelGt($level,$value['agent_level'])){
                    $money = money()->mul($amount,$dict['A1020']['service_reward']);
                    $data['A1020']['user_info'] = $value;
                    $data['A1020']['manage'] = money()->sub($money,$assign);
                    $assign = $money;
                    //下一个等级
                    $level = 'A1030';
                }  
            }elseif($value['agent_level'] == 'A1030'){
                if(!money()->levelGt($level,$value['agent_level'])){
                    $money = money()->mul($amount,$dict['A1030']['service_reward']);
                    $data['A1030']['user_info'] = $value;
                    $data['A1030']['manage'] = money()->sub($money,$assign);
                    $assign = $money;
                    //下一个等级
                    $level = 'A1040';
                }               
            }
        }
        return $data;
    }



    private function getDict($level_dict,$code){
        foreach($level_dict as $value){
            if($value['code'] == $code){
                return $value;
            }
        }
    }




}