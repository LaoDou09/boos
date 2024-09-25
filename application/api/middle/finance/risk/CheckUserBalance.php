<?php

namespace app\api\middle\finance\risk;
use app\admin\model\user\UserInfo;
use Closure;
use tools\service\Middleware;
use app\api\service\finance\FinanceBalanceService;

class CheckUserBalance implements Middleware {

    public function handle($request, Closure $next)
    {
        $cash_order = $request['cash_order'];
        $balances = app(FinanceBalanceService::class)->getUserBalance($request['user_id']);
        foreach($balances as $value){
            if($value['account_type'] == '10'){
                if($value['balance'] < $cash_order['amount']){
                    $content = '用户ID:'.$cash_order['user_id']
                        .',账户类型:'.$value['account_type'].'不足'
                        .',余额:'.$value['balance']
                        .',交易额'.$cash_order['amount'];
                    err($content);
                }
            }

        }
        return $next($request);
    }
}