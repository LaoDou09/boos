<?php

namespace app\api\middle\finance\risk;

use app\api\service\finance\FinanceBalanceService;
use Closure;
use tools\service\Middleware;

class CheckLevelSystem implements Middleware {

    public function handle($request, Closure $next)
    {
        $level_system = $request['level_system'];
        $userInfo = getUserInfo();
        $balances = app(FinanceBalanceService::class)->getUserBalance($userInfo);
        foreach($balances as $value){

            if($value['account_type'] == $level_system['account_type1']){
                if($value['balance'] < $level_system['price1']){
                    err('账户类型:'.$value['account_type'].'---余额不足');
                }
            }
            if($value['account_type'] == $level_system['account_type2']){
                if($value['balance'] < $level_system['price2']){
                    err('账户类型:'.$value['account_type'].'---余额不足');
                }
            }

            if($value['account_type'] == $level_system['account_type3']){

                if($value['balance'] < $level_system['price3']){
                    err('账户类型:'.$value['account_type'].'---余额不足');
                }
            }

        }
        return $next($request);
    }
}