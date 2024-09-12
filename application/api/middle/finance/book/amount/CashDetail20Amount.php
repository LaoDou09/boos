<?php

namespace app\api\middle\finance\book\amount;

use Closure;
use tools\service\Middleware;

class CashDetail20Amount implements Middleware {

    public function handle($request, Closure $next)
    {
        $cash_order = $request['cash_order'];
        $details = json_decode($cash_order['details'],true);
        $amount = $details['20'];
        $request['amount'] = $amount;
        return $next($request);
    }
}