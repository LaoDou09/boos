<?php

namespace app\api\hook\finance;

use app\api\service\finance\FinanceBalanceService;


class FinanceAccountHook {

    public function run(&$response)
    {
        //这里要帮用户注册财务账号
        app(FinanceBalanceService::class)->createUserBalance($response);
    }
}