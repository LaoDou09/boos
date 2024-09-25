<?php
namespace app\api\middle\finance\cash;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\finance\FinanceBookTemplate;
use app\admin\model\user\UserInfo;
use app\api\library\Sign;
use Closure;
use think\Log;
use tools\service\Middleware;

class BookOrderProcess implements Middleware {

    public function handle($request, Closure $next)
    {
        $templates =  model(FinanceBookTemplate::class)
                ->where('book_code',$request['code'])
                ->order('batch_detail_id','asc')
                ->select();
        if(!$templates){
            err("没有相应的记账模板,记账码::".$request['code']);
        }
        $request = $this->bookTemplateHandle($templates,$request);
        $request = service()
            ->pass($request)
            //删除无效流水,金额为0的
            ->middle(RemoveInvalidOrder::class)
            //试算平衡计算
            ->middle(CheckBalance::class)
            ->run();
        //保存记录
        foreach($request['book_orders'] as $order){
          $order->isUpdate(false)->save();  
        }
        return $next($request);
    }

    private function bookTemplateHandle($templates,$request){
        $book_orders = []; 
        $batch_id =$request['cash_order']['id'];
        $request['templates'] = $templates;

        foreach($templates as $key=>$template){
            //初始化一些值,防止出现错误
            $request['process_id']='';
            $request['amount'] = '';
            $request['template'] = $template;
            if($template['book_bean']){
                //独立记账
                Log::info('-----独立记账-----::'.$template['book_bean']);
                $request = service()
                    ->pass($request)
                    ->middle($template['book_bean'])
                    ->run();
                foreach($request['custom_books'] as $k=>$v){
                     //detail_id的计算
                    $v['batch_detail_id'] = $template['batch_detail_id'].'.'.$k;
                    $book_orders[] = $v;
                }
                $request['book_orders'] = $book_orders;
            }else{
                //模板记账
                Log::info('-----模板记账开始-----::'.$template['batch_detail_id']);
                //这里一定要new出新的收银单,防止单实例情况
                $order = new FinanceBookOrder();
                $order['book_title'] = $template['book_title'];
                $order['account_id'] = $this->getAccountId($template);
                $order['batch_id'] = $batch_id;
                $order['batch_detail_id']=$template['batch_detail_id'];
                $order['book_code'] = $template['book_code'];
                $order['account_type'] = $template['account_type'];
                $order['account_object'] = $template['account_object'];
                $order['book_category'] = $template['book_category'];
               
               
                $cash_order = $request['cash_order'];
                if($order['account_object']=='80'){
                    //这里应该根据方向计算user_name
                    //负债为10 为转出
                    if($template['direction'] =='10'){
                        $order['user_name'] = $this->getProcessUserName($cash_order['user_id']);
                    }else{
                        if(isset($cash_order['to_user_id'])){
                            $order['user_name'] = $this->getProcessUserName($cash_order['to_user_id']);
                        }
                    }
                }
                $order['process_id'] = $this->getProcessId($template,$request);
                $order['debit_amount'] = $this->getDebitAmount($template,$request);
                $order['credit_amount'] = $this->getCreditAmount($template,$request);
                $order['direction'] = $template['direction'];
                $order['remark'] = $this->getRemark($template,$request);
                $order['sign'] = Sign::makeBookSign($order);
                $order['status'] = '10';
                $book_orders[] = $order;            
            }
        }
        $request['book_orders'] = $book_orders;
        return $request;
    }

    private function getProcessUserName($user_id){
        $user_info = model(UserInfo::class)->getByUserId($user_id);
        // Log::info("user_info::".json_encode($user_info));
        return $user_info['user_name'];
    }


    //账套id
    private function getAccountId($template){
        return '1';
    }

    //processId
    private function getProcessId($template,$request){
        if($template['process_id']){
            return $template['process_id'];
        }
        $request = service()->pass($request)->middle($template['process_bean'])->run();
        return $request['process_id'];
    }

    //借方金额
    private function getDebitAmount($template,$request){
        $direction = config('site.finance_book_direction')['debit'];
        if($template['direction'] == $direction){
            if($template['debit_amount'] != null && $template['debit_amount'] >0 ){
                return $template['debit_amount'];
            }else if($template['debit_amount_bean'] != null){
                $request = service()->pass($request)->middle($template['debit_amount_bean'])->run();
                return $request['amount'];
            }
        }
        return 0;
    }
    
    //贷方金额
    private function getCreditAmount($template,$request){
        $direction = config('site.finance_book_direction')['credit'];
        if($template['direction'] == $direction){
            if($template['credit_amount'] != null && $template['credit_amount'] >0 ) {
                return $template['credit_amount'];
            } else if ($template['credit_amount_bean'] != null){
                $request = service()->pass($request)->middle($template['credit_amount_bean'])->run();
                return $request['amount'];
            }
        }
        return 0;


    }
    
    //标注摘要
    private function getRemark($template,$request){
        //来源:cash_order,template..,$request['remark]
        $cash_order = $request['cash_order'];
        if(isset($cash_order['remark'])){
            $content = $cash_order['remark']; 
        }else{
            $content = "";
        }
        $content .= "::".$template['remark'];
        if(isset($request['remark'])){
            $content .= "::".$request['remark'];
        }
        return $content;
    }

}