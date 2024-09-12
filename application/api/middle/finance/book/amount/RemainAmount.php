<?php
namespace app\api\middle\finance\book\amount;

use Closure;
use tools\service\Middleware;

class RemainAmount implements Middleware {

    public function handle($request, Closure $next)
    {
        
        //一般这是最后的记账明细
        $book_orders = $request['book_orders'];

        $debit_amount = array_reduce($book_orders,function($result,$order){
            return money()->add($result,$order['debit_amount']);
        });
        
        $credit_amount = array_reduce($book_orders,function($result,$order){
            return money()->add($result,$order['credit_amount']);
        });


        $amount = abs(money()->sub($debit_amount,$credit_amount));

    
        $request['amount'] = $amount;

        return $next($request);
    }
}