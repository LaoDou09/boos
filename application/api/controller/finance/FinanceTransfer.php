<?php

namespace app\api\controller\finance;

use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\api\service\finance\FinanceCashService;
use app\common\controller\Api;
use app\common\library\Auth;

class FinanceTransfer extends Api {

    protected $noNeedRight = '*';

    public function trans20ToUser(){

        $rule = [
            'mobile' =>'require',
            'amount' =>'number'
        ];
        $data = [
            'mobile' =>$this->request->post('mobile'),
            'amount' =>$this->request->post('amount')
        ];

        $ret = $this->validate($data,$rule);
        if($ret != 1){
            err($ret);
        }

        $user_info = getUserInfo();
        $to_user = model(UserInfo::class)->where('login_name',$data['mobile'])->find();

        $cash_order = model(FinanceCashOrder::class);
        $cash_order['user_id'] = $user_info['user_id'];
        $cash_order['user_mobile'] = $user_info['login_name'];
        $cash_order['user_name'] = $user_info['user_name'];
        $cash_order['trade_type'] = 'transfer_20';
        $cash_order['amount'] = $data['amount'];
        $cash_order['to_user_id'] = $to_user->user_id;
        $this->ok(app(FinanceCashService::class)->main($cash_order));

    }
}