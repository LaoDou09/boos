<?php

namespace app\api\hook;

use app\api\service\report\UserIncomeService;

class UserIncomeHook {
    public function run(&$response)
    {
        //在记账成功更新记账流水Hook,记录用户收入统计
        app(UserIncomeService::class)->addUserIncome($response);
    }
}