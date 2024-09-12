<?php
namespace app\test\middle;
use Closure;
use think\Log;
use tools\service\Middleware;

class MiddleTwo implements Middleware {

    public function handle($request, Closure $next)
    {
        $request["two"] = "two";
        Log::info("2222222222");
        dd($request);
        err('有错误',30);
        return $next($request);
    }
}