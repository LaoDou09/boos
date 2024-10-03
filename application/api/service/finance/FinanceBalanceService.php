<?php
namespace app\api\service\finance;

use app\admin\model\finance\FinanceBalance;
use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\user\UserInfo;
use app\api\hook\UserIncomeHook;
use app\api\library\Sign;
use app\api\service\report\UserIncomeService;
use Exception;
use think\Db;
use think\Hook;
use think\Log;

class FinanceBalanceService {

   
    public function createUserBalance($response){

        $processId = $response['user_id'];
        Log::info('user account create ::'.$processId);
        $data = [
            'account_id' =>'1',
            'account_object' =>'80',
            'user_name' =>$response['user_name'],
            'process_id' =>$processId,
            'balance' =>0,
            'open_balance' =>0,
            'occurred_amount'=>0,
            'direction' =>'0'
        ];
        $type = config('finance.account_type');
        Db::startTrans();
        try{
            foreach($type as $k=>$v){
                $data['account_type'] = $k;
                FinanceBalance::create($data);
                Db::commit();
            }
        }catch(Exception $e){
            Db::rollback();
            Log::info('create account err::',$e->getMessage());
        }

    }


    public function getUserBalance($user_id){

        $balance = model(FinanceBalance::class)
            ->where('process_id',$user_id)
            ->select();
        return $balance;
    }

    //
    public function updateBalance($book_orders){
        Log::info('-----财务余额记账更新开始-----');
        
        $account = [];
        foreach($book_orders as $order){
            $key = $order['process_id'].$order['account_type'].$order['account_object'];
            //如此做的原因是合并计算相同账户
            $record = isset($account[$key]) ? $account[$key] : null;
            $balance = $this->getBalance($order,$record);
            $account[$key] = $balance;
        }
        foreach($account as $acc){
            $acc->isUpdate(true)->save();
        }
        foreach($book_orders as $order){
            //批次成功,移动history
            // $order['status'] = '00';
            // $history = model(FinanceBookOrderHistory::class);
            // foreach($order as $k=>$v){
            //     $history[$k] = $v;
            // }
            // $history->isUpdate(false)->save();
            $model = model(FinanceBookOrder::class)->getById($order['id']);
            $model->status = '00';
            $model->isUpdate(true)->save();
            //命令行模式下执行的Hook好像有问题,暂时直接调用,应该redis模式
            if($model['account_object'] == '80'){
                app(UserIncomeService::class)->addUserIncome($model);
            }
        }
        

    }

    private function getBalance($order,$record){
        if($record){
            $balance = $record;
        }else{
            $balance = model(FinanceBalance::class)
                ->where('process_id',$order['process_id'])
                ->where('account_type',$order['account_type'])
                ->where('account_object',$order['account_object'])
                ->find();
            // $last_sql = FinanceBalance::getLastSql();
            // Log::info($last_sql);

            if(!$balance){
                Log::info('用户账户不存在::'.$order['process_id'].'::'.$order['account_type']);
                err('用户账户不存在');
            }
            if(!Sign::checkBalanceSign($balance)){
                Log::info('用户财务账户验签失败::'.$balance['process_id']);
                err('用户财务账户验签失败');
            }
        }
        $balance['close_order'] = $order['id'];
        $balance['direction'] = $this->calcDirection($order);
        $balance['open_balance'] = $balance['balance'];
        $balance['occurred_amount'] = $this->calcOccurredAmount($order);
        $balance['balance'] = $this->calcBalance($balance);
        $balance['sign'] = Sign::makeBalanceSign($balance);
        return $balance;
    }

    //计算收入支出方向
    private function calcDirection($order){
        switch($order['book_category']){
            case "1":  //资产
            case "5":  //主营成本
                if($order['direction'] == '10'){
                    return "10";
                }else{
                    return "20";
                }
            case "2":  //负债
            case "3":  //所有者权益
            case "4":  //其它收入利润
            case "6":  //主营收入利润
                if($order['direction'] == '20'){
                    return "10";
                }else{
                    return "20";
                }
        }

    }

    private function calcOccurredAmount($order){
        if($order['direction'] == '10'){
            return $order['debit_amount'];
        }else if ($order['direction'] == '20'){
            return $order['credit_amount'];
        }
    }

    private function calcBalance($balance){
        if($balance['direction'] == '10'){
            return money()->add($balance['open_balance'],$balance['occurred_amount']);
        }else if ($balance['direction'] == '20'){
            return money()->sub($balance['open_balance'],$balance['occurred_amount']);
        }
    }

}