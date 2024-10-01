<?php

namespace app\api\middle\finance\risk;

use app\api\service\report\UserIncomeService;
use Closure;
use tools\service\Middleware;

class CheckUserIncomeLimit implements Middleware {
    
    public function handle($request, Closure $next)
    {
        $ret = app(UserIncomeService::class)->checkLimit($request['user_id']);
        if($ret){
            err('用户收入超限');
        }
        return $next($request);
    }
}