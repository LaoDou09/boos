<?php
namespace app\test\controller\api;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserTeam;
use app\common\controller\Api;
use app\test\model\Test;
use think\Db;

class Six extends Api {
    public $noNeedLogin = ['*'];
    public function test(){
        $ids = "1142889689825594113,1942968353023746081,1892935565346467220,1892977120262353191,1901957145742560628,1939746459780425757,1941157205232003252,1876307630827120147";

        $teams= model(UserInfo::class)
            ->whereIn('user_id',$ids)
            ->orderRaw("field(user_id,$ids) desc")
            ->select();

        $this->ok($teams);

    }

    public function test1(){
        $ret = [];
        $records = model(FinanceBookOrder::class)
        ->where('account_type','10')
        ->where('status','00')
        ->where('account_object','80')
        ->whereTime('create_time','2024-09-06')
        ->field('process_id,SUM(debit_amount) as sub_debit ,SUM(credit_amount) as sub_credit')
        ->group('process_id')
        ->select();
        $time = date('Y-m-d',strtotime('-6 day'));
        $lastSql= FinanceBookOrder::getLastSql();
        $this->ok($time);

    }

    public function test2(){
        $records = model(UserTeam::class)
            ->field('user_id')
            ->where('FIND_IN_SET(:id, path)',['id'=>'1142889689825594113'])
            ->select();
        $ids = '';
        foreach($records as $record){
            $ids .= $record['user_id'].',';
        }
        $ids = rtrim($ids,',');

        $data = model(UserInfo::class)
            ->where('user_level','U1030')
            ->whereIn('user_id',$ids)
            ->count();

            // ->getField('user_id',true);
        $this->ok($data);
    }

    public function test3(){
        $start = '2024-09-06 00:00:00';
        $end = '2024-09-06 23:59:59';
        $ret = model(FinanceCashOrder::class)
            ->where('status','00')
            ->where('create_time','between',[$start,$end])
            ->sum('amount');

        // $lastSql = FinanceCashOrder::getLastSql();
        $this->ok($ret);

    }
    
}