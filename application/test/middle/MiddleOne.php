<?php
namespace app\test\middle;
use Closure;
use think\Log;
use tools\service\Middleware;

class MiddleOne implements Middleware {

    public function handle($request, Closure $next)
    {
        $request["one"] = "one";
        Log::info("111111111111");
        return $next($request);
    }

}