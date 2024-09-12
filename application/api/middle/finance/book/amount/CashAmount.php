<?php

namespace app\api\middle\finance\book\amount;

use Closure;
use tools\service\Middleware;

class CashAmount implements Middleware {

    public function handle($request, Closure $next)
    {
        $amount = $request['cash_order']['amount'];
        $request['amount'] = $amount;
        return $next($request);
    }
}