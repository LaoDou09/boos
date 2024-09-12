<?php

namespace app\api\controller\finance;

use app\admin\model\finance\FinanceCashOrder as CashOrder;
use app\common\controller\Api;

class FinanceCashOrder extends Api {
    //生产需要Login认证
    protected $noNeedRight = '*';

    public function getCashOrder(){
        //todo需要验证
        $userInfo = getUserInfo();
        $order = model(CashOrder::class)
            ->where('user_id',$userInfo['user_id'])
            ->limit(10)
            ->order('id','desc')
            ->select();
        $this->ok($order);
    }

    public function getToUserOrder(){
        $userInfo = getUserInfo();
        $order = model(CashOrder::class)
            ->where('to_user_id',$userInfo['user_id'])
            ->limit(10)
            ->order('id','desc')
            ->select();
        $this->ok($order);   
    }

}