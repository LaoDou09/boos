<?php

namespace app\api\controller\finance;

use app\api\service\finance\FinanceBalanceService;
use app\common\controller\Api;

class FinanceBalance extends Api {

    protected $noNeedRight = '*';
    public function getUserBalance()
    {
        $userInfo = getUserInfo();
        $this->ok(app(FinanceBalanceService::class)->getUserBalance($userInfo['user_id']));
    }

}