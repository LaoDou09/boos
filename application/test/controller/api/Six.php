<?php
namespace app\test\controller\api;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserTeam;
use app\api\service\finance\FinanceRiskService;
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

        $account_type = '10';
        // $account_type = '91';

        $time = date('Y-m-d',strtotime('-6 day'));
        $model = model(FinanceBookOrder::class);
        if($account_type =='10'){
            $model->where(function($query){
                $query->whereOr('book_code','K9001');
                $query->whereOr('book_code','K2001');
                $query->whereOr('book_code','K3001');

            });
        }else if ($account_type == '91'){
            $model->where('book_code','K8001');
        }

        $records = $model
            ->where('account_type',$account_type)
            ->where('status','00')
            ->where('account_object','80')
            ->whereTime('create_time','>=', $time.'00:00:00')
            ->whereTime('create_time','<=', $time.'23:59:59')
            ->field('process_id,SUM(debit_amount) as sum_debit ,SUM(credit_amount) as sum_credit')
            ->group('process_id')
            ->select();
        $lastSql = $model->getLastSql();
        // halt($lastSql) ;
        $this->ok($lastSql);

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
    public function test4(){
        $ret = model(FinanceCashOrder::class)
            ->limit(4,10)
            ->select();
        $this->ok($ret);
    }

    public function test5(){
        $data = model(FinanceCashOrder::class);
        $data['user_id'] ='1142889689825594113';
        $request['cash_order'] = $data;
        $ret = app(FinanceRiskService::class)->check('K2001',$request);
        $this->ok($ret);
    }
}