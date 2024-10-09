<?php

namespace app\api\middle\finance\risk;

use app\api\service\report\UserIncomeService;
use Closure;
use tools\service\Middleware;

class CheckUserBlindLimit implements Middleware {
    
    public function handle($request, Closure $next)
    {
        $ret = app(UserIncomeService::class)->checkBlindLimit($request['user_id']);
        if($ret){
            err('用户盲盒收益超限');
        }
        return $next($request);
    }
}