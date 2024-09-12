<?php

namespace app\api\middle\finance\risk;

use app\admin\model\user\UserInfo;
use Closure;
use tools\service\Middleware;
use app\api\service\finance\FinanceBalanceService;
use think\Log;

class CheckUser91Balance implements Middleware {

    public function handle($request, Closure $next)
    {
        //这样获取user_info 的原因是cli任务中没有auth
        // $userInfo = getUserInfo();
        $cash_order = $request['cash_order'];
        $user_info = model(UserInfo::class)->getByUserId($cash_order['user_id']);
        $balances = app(FinanceBalanceService::class)->getUserBalance($user_info);
        foreach($balances as $value){

            if($value['account_type'] == '91'){
                if($value['balance'] < $cash_order['amount']){
                    err('账户类型:'.$value['account_type'].'---余额不足');
                }
            }

        }
        return $next($request);
    }
}