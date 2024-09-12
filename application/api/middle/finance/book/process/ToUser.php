<?php
namespace app\api\middle\finance\book\process;

use Closure;
use tools\service\Middleware;

class ToUser implements Middleware {

    public function handle($request, Closure $next)
    {
        
        $process_id = $request['cash_order']['to_user_id'];
        $request['process_id'] = $process_id;

        return $next($request);
    }
}