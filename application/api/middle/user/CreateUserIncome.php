<?php

namespace app\api\middle\user;

use app\api\service\report\UserIncomeService;
use Closure;
use tools\service\Middleware;

class CreateUserIncome implements Middleware {


    public function handle($request, Closure $next)
    {
        $user_info = $request['user_info'];
        $levelSystem = $request['level_system'];
        app(UserIncomeService::class)->createRecord($user_info,$levelSystem);
        return $next($request);
    }

}