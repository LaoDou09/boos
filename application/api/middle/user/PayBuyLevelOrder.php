<?php

namespace app\api\middle\user;

use app\admin\model\finance\FinanceCashOrder;
use app\api\service\finance\FinanceCashService;
use Closure;
use tools\service\Middleware;

class PayBuyLevelOrder implements Middleware {


    public function handle($request, Closure $next)
    {
        
        $order = $request['level_sale_order'];
        $cash_order = model(FinanceCashOrder::class);
        //组建cash_order
        //-----------------------------------------------睡觉
        $cash_order['user_id'] = $order['user_id'];
        $cash_order['user_name'] = $order['login_name'];
        $cash_order['user_mobile'] = $order['login_name'];
        $cash_order['trade_type'] = $order['trade_type'];
        $cash_order['relation_id'] = $order['id'];

        if($order['account_type2'] == '10'){
            $cash_order['amount'] = $order['price2'];
        }else if($order['account_type3'] == '10'){
            $cash_order['amount'] = $order['price3'];
        }else{
            $cash_order['amount'] = $order['price1'];
        }
        if($order['account_type1']){
            $details[$order['account_type1']] = $order['price1'];
        }
        if($order['account_type2']){
            $details[$order['account_type2']] = $order['price2'];
        }
        if($order['account_type3']){
            $details[$order['account_type3']] = $order['price3'];
        }
        $details['user_team'] = $request['user_team'];
        $cash_order['details'] = json_encode($details);
        //不必再走一边风控了
        $request['finance_pay'] = app(FinanceCashService::class)->main($cash_order,false);
        return $next($request);
    }

}