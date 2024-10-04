<?php

namespace app\api\middle\user;

use Closure;
use tools\service\Middleware;
use app\api\service\report\UserIncomeService;
use think\Log;

class UpdateUserIncomeLimit implements Middleware {


    public function handle($request, Closure $next)
    {
        Log::info('更新用户限额');
        $user_info = $request['user_info'];
        $levelSystem = $request['level_system'];
        app(UserIncomeService::class)->updateUserLimit($user_info,$levelSystem);
        return $next($request);
    }
}