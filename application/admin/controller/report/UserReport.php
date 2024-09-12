<?php

namespace app\admin\controller\report;

use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserTeam;
use app\common\controller\Backend;
use fast\Tree;


class UserReport extends Backend {

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\user\UserInfo;
    }

    public function index(){


        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = 0;

            $list = [];
            $param = $this->request->param('search');
            //为了节省查询,没有search的时候,不给数据
            if($param){
                //todo这里慢慢修改成like
                $list = $this->model
                    ->where('user_id',$param)
                    ->whereor('user_name',$param)
                    ->order($sort,$order)
                    ->limit($offset,$limit)->select();
                $list = collection($list)->toArray();
                $total = $this->model->where($where)->count();
                //实际只有一条数据
                foreach($list as &$v){
                    $user_id = $v['user_id'];
                    //这里找直推也即是user_team的parent1 
                    $promotions = $this->getPromotionIds($user_id);
                    $v['u1010'] = $this->countPromotions($promotions,'U1010');
                    $v['u1020'] = $this->countPromotions($promotions,'U1020');
                    $v['u1030'] = $this->countPromotions($promotions,'U1030');
                    //业绩需要找path中包含user_id的
                    $teams = $this->getTeamsIds($user_id);
                    $today =[
                        'begin' => date('Y-m-d 00:00:00'),
                        'end' => date('Y-m-d 23:59:59')
                    ];
                    $month =[
                        'begin' => date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ),
                        'end' => date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) )
                    ];
                    $v['kpi_today'] = $this->calcKpi($teams,$today);
                    $v['kpi_month'] =$this->calcKpi($teams,$month);
                    $v['kpi_all'] =$this->calcKpi($teams,[]);
                }
            }
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

    private function getPromotionIds($user_id){
        $records = model(UserTeam::class)
            ->field('user_id')
            ->where('parent1',$user_id)
            ->select();
        return $this->getIds($records);
    }

    private function getTeamsIds($user_id){
        //path中包含自己的所有user_id
        $records = model(UserTeam::class)
            ->field('user_id')
            ->where('FIND_IN_SET(:id, path)',['id'=>$user_id])
            ->select();
        return $this->getIds($records);
    }

    private function calcKpi($teams,$time){
        $record = model(FinanceCashOrder::class)
            ->whereIn('user_id',$teams)
            ->where('trade_type','buy_level')
            ->where('status','00');
        if(!empty($time)){
            $record->where('create_time','between',[$time['begin'],$time['end']]);
        }
        return $record->sum('amount');
    }

    private function getIds($records){
        $ids ='';
        foreach($records as $record){
            $ids .= $record['user_id'].',';
        }
        $ids = rtrim($ids,',');
        return $ids;
    }

    private function countPromotions($ids,$level){
        return model(UserInfo::class)
            ->where('user_level',$level)
            ->whereIn('user_id',$ids)
            ->count();
    }

}