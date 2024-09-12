<?php

namespace app\api\middle\finance\risk;

use Closure;
use think\Log;
use tools\service\Middleware;

class RequestCarSys implements Middleware {


    public function handle($request, Closure $next)
    {
        // $cash_order = $request['cash_order'];
        // Log::info(json_encode($cash_order));
        // err('request_url请求错误'); 
        // $url = '';
        // $data =[];
        // $ret = request_url($url,$data,'POST');
        // //根据返回码,如果错误则抛错
        // if($ret['code']){

        //     err('request_url请求错误');
        // }
        return $next($request);
    }
}