<?php
namespace app\api\middle\finance\cash;

use Closure;
use think\Log;
use tools\service\Middleware;

class RemoveInvalidOrder implements Middleware {

    public function handle($request, Closure $next)
    {
        Log::info('-----删除无效流水-----');
        $book_orders = $request['book_orders'];
        $valid = array_filter($book_orders,function($order){
            if($order['process_id'] == null){
                return false;
            }
            if(money()->add($order['debit_amount'],$order['credit_amount'])<= 0){
                return false;
            }
            return true;
        });
        $request['book_orders'] = $valid;
        return $next($request);
    }
}