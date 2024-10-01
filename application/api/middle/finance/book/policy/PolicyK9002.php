<?php

namespace app\api\middle\finance\book\policy ;

use Closure;
use tools\service\Middleware;

class PolicyK9002 implements Middleware {

    //记账策略都是返回false或者true
    public function handle($request, Closure $next)
    {
        //数据可以这样计算   
        // $data = "123123";
        // $ret = money()->calc($data,$request['operators'],$request['policy_value']);
        return $next(true);
    }
}