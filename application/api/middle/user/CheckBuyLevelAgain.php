<?php

namespace app\api\middle\user;

use app\api\service\finance\FinanceRiskService;
use Closure;
use tools\service\Middleware;

class CheckBuyLevelAgain implements Middleware {

    public function handle($request, Closure $next)
    {
        
        $level_system = $request['level_system'];
        $trade_type = $level_system['trade_type'].'_again';
        $request['trade_type'] = $trade_type;
        $book_code = config('site.'.$trade_type);
        if(!$book_code){
            err('此交易类型没有记账码对应,暂不支持');
        }
        $userInfo = $request['user_info'];
        if($userInfo['user_level'] == 'U1000'){
            err('当前会员等级不可购买!');
        }

        $request = app(FinanceRiskService::class)->check($book_code,$request);
        return $next($request);
    }
}