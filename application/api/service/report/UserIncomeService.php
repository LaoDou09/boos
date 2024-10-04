<?php

namespace app\api\service\report;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\report\ReportUserIncome;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserLevelSystem;
use think\Log;

class UserIncomeService {
   
    //检查用户是否收益超限
    //超限返回true
    public function checkLimit($user_id){
       $record = model(ReportUserIncome::class)->getByUserId($user_id);
       $total = money()->add($record['promotion'],$record['blind']);
       $total = money()->add($total,$record['profit']);
       $ret = money()->gte($total,$record['limit']);
       return $ret;
    }

    //buy_level时创建记录
    public function createRecord(UserInfo $userInfo,UserLevelSystem $levelSystem){
        $record = model(ReportUserIncome::class);
        $record['user_id'] = $userInfo['user_id'];
        $record['user_name']= $userInfo['user_name'];
        $record['promotion'] = 0;
        $record['blind'] = 0;
        $record['profit'] = 0;
        $record['limit'] = $levelSystem['price3'];
        $record->isUpdate(false)->save();
    }

    //复购更新限额
    public function updateUserLimit(UserInfo $userInfo,UserLevelSystem $levelSystem){
        $record = model(ReportUserIncome::class)->getByUserId($userInfo['user_id']);
        $record['limit'] = money()->add($record['limit'],$levelSystem['price3']);
        $record->isUpdate(true)->save();
    }

    public function addUserIncome($order){
        Log::info('增加用户收入');
        switch($order['book_code']){
            //推广收益
            case 'K9001' :
            case 'K9002' :
                $this->updatePromotion($order);
                break;
            //盲盒收益
            case 'K5XX' :
                $this->updateBlind($order);
                break;
            //积分分红
            case 'K3XXX' :
                $this->updateProfit($order);
                break;

        }

    }


    public function updatePromotion($order){
        $record = model(ReportUserIncome::class)->getByUserId($order['process_id']);
        $record['promotion'] = money()->add($record['promotion'],$order['credit_amount']);
        $record->isUpdate(true)->save();

    }

    public function updateBlind($order){
        $record = model(ReportUserIncome::class)->getByUserId($order['process_id']);
        $record['blind'] = money()->add($record['blind'],$order['credit_amount']);
        $record->isUpdate(true)->save();

    }

    public function updateProfit($order){
        $record = model(ReportUserIncome::class)->getByUserId($order['process_id']);
        $record['profit'] = money()->add($record['profit'],$order['credit_amount']);
        $record->isUpdate(true)->save();

    }
}