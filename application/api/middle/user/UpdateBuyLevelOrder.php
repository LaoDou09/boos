<?php

namespace app\api\middle\user;

use Closure;
use tools\service\Middleware;

class UpdateBuyLevelOrder implements Middleware {

    public function handle($request, Closure $next)
    {
        
        $order = $request['level_sale_order'] ;
        $order['status'] = '00';
        $order->isUpdate(true)->save();
        return $next($request);
    }
}