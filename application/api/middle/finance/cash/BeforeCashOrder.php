<?php

namespace app\api\middle\finance\cash;

use Closure;
use think\Log;
use tools\service\Middleware;

class BeforeCashOrder implements Middleware {

    public function handle($request, Closure $next)
    {
        Log::info("-----收银前策略-----");
        //根据交易类型查询策略表,sort排序,status=00
        //trade_type = 
        //bean_type = before
        
        return $next($request);
    }
}