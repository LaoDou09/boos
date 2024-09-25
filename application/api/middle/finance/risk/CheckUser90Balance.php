<?php

namespace app\api\middle\finance\risk;

use app\admin\model\user\UserInfo;
use Closure;
use tools\service\Middleware;
use app\api\service\finance\FinanceBalanceService;
use think\Log;

class CheckUser90Balance implements Middleware {

    public function handle($request, Closure $next)
    {

        $cash_order = $request['cash_order'];
        $balances = app(FinanceBalanceService::class)->getUserBalance($request['user_id']);
        foreach($balances as $value){

            if($value['account_type'] == '90'){
                if($value['balance'] < $cash_order['amount']){
                    err('账户类型:'.$value['account_type'].'---余额不足');
                }
            }

        }
        return $next($request);
    }
}