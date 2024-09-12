<?php
namespace app\api\middle\finance\cash;

use Closure;
use tools\service\Middleware;

class BookPolicy implements Middleware{

    public function handle($request,Closure $next){
        //根据book_code找到bean执行后替换code
        //todo 

        
        $request['code'] = $request['book_code'] ;
        return $next($request);
    }
}