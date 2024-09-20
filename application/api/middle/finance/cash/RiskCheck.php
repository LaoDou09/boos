<?php

namespace app\api\middle\finance\cash;

use app\api\service\finance\FinanceRiskService;
use Closure;
use tools\service\Middleware;

class RiskCheck implements Middleware {

    public function handle($request, Closure $next){
        //根据记账码检查风控
        //可控风控 true false
        if($request['risk_check']){
            $request = app(FinanceRiskService::class)->check($request['book_code'],$request);
        }
        return $next($request);

    }
}