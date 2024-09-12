<?php
namespace app\api\middle\finance\book\process;

use Closure;
use tools\service\Middleware;

class RequestUser implements Middleware {

    public function handle($request, Closure $next)
    {
        //记账请求的用户
        $process_id = $request['cash_order']['user_id'];
        $request['process_id'] = $process_id;
        return $next($request);
    }
}