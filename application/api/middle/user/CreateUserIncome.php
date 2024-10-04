<?php

namespace app\api\middle\user;

use app\api\service\report\UserIncomeService;
use Closure;
use think\Log;
use tools\service\Middleware;

class CreateUserIncome implements Middleware {


    public function handle($request, Closure $next)
    {
        Log::info('创建用户收入统计');
        $user_info = $request['user_info'];
        $levelSystem = $request['level_system'];
        app(UserIncomeService::class)->createRecord($user_info,$levelSystem);
        return $next($request);
    }

}