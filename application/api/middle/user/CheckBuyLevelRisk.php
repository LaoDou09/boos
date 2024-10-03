<?php

namespace app\api\middle\user;

use app\api\service\finance\FinanceRiskService;
use Closure;
use tools\service\Middleware;

class CheckBuyLevelRisk implements Middleware {


    public function handle($request, Closure $next)
    {
        $level_system = $request['level_system'];
        $trade_type = $level_system['trade_type'];
        $request['trade_type'] = $trade_type;
        $book_code = config('site.'.$trade_type);
        if(!$book_code){
            err('此交易类型没有记账码对应,暂不支持');
        }

        $request = app(FinanceRiskService::class)->check($book_code,$request);
        return $next($request);
    }

}