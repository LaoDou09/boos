<?php

namespace app\api\middle\finance\cash;

use Closure;
use think\Log;
use tools\service\Middleware;

class CheckBalance implements Middleware {

    public function handle($request, Closure $next)
    {
        Log::info('-----试算平衡检查-----');
        $book_orders = $request['book_orders'];
        $debit_amount = array_reduce($book_orders,function($result,$order){
            return money()->add($result,$order['debit_amount']);
        });
        
        $credit_amount = array_reduce($book_orders,function($result,$order){
            return money()->add($result,$order['credit_amount']);
        });

        if($debit_amount != $credit_amount){
            err('试算不平衡');
        }
        return $next($request);
    }
}