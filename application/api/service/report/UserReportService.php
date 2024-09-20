<?php

namespace app\api\service\report;

use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserTeam;
class UserReportService {


    public function calcUserKpi($user_id){
        
        //这里找直推也即是user_team的parent1 
        $promotions = $this->getPromotionIds($user_id);
        $ret['u1010'] = $this->countPromotions($promotions,'U1010');
        $ret['u1020'] = $this->countPromotions($promotions,'U1020');
        $ret['u1030'] = $this->countPromotions($promotions,'U1030');
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
        $ret['kpi_today'] = $this->calcKpi($teams,$today);
        $ret['kpi_month'] =$this->calcKpi($teams,$month);
        $ret['kpi_all'] =$this->calcKpi($teams,[]);

        return $ret;
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

        $ret = model(UserInfo::class)
            ->where('user_level',$level)
            ->whereIn('user_id',$ids)
            ->count();

        return $ret;
    }


}