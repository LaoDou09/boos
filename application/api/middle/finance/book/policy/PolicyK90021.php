<?php

namespace app\api\middle\finance\book\policy ;

use Closure;
use tools\service\Middleware;

class PolicyK90021 implements Middleware {


    public function handle($request, Closure $next)
    {
        

        return $next(false);
    }
}