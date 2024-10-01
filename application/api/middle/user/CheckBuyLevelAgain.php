<?php

namespace app\api\middle\user;

use app\api\service\finance\FinanceCashService;
use Closure;
use tools\service\Middleware;

class CheckBuyLevelAgain implements Middleware {

    public function handle($request, Closure $next)
    {
        
        $level_system = $request['level_system'];
        $trade_type = $level_system['trade_type'].'_again';
        $book_code = config('site.'.$trade_type);
        if(!$book_code){
            err('此交易类型没有记账码对应,暂不支持');
        }
        $request = app(FinanceCashService::class)->check($book_code,$request);
        return $next($request);
    }
}