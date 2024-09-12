<?php

namespace app\api\middle\finance\risk;

use Closure;
use tools\service\Middleware;

class CheckUserLevel implements Middleware {

    public function handle($request, Closure $next)
    {
        $userInfo = getUserInfo();
        if($userInfo['user_level'] != 'U1000'){
            err('当前会员等级不可购买!');
        }
        return $next($request);
    }
}