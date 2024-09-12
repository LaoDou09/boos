<?php
namespace app\test\middle;

use Closure;
use think\Log;
use tools\service\Middleware;

class MiddleThree implements Middleware
{

    public function handle($request, Closure $next)
    {
        $request["three"] = "three";
        Log::info("3333333333");
        return $next($request);
    }
}