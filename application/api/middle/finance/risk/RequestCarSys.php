<?php

namespace app\api\middle\finance\risk;

use Closure;
use think\Log;
use tools\service\Middleware;

class RequestCarSys implements Middleware {


    public function handle($request, Closure $next)
    {
        $cash_order = $request['cash_order'];
        //测试服地址
        // $url = 'http://apicar.huarenjuchang.com/openapi/transfer/shopAsyncPointsController';
        //生成地址
        $url = 'http://apicar.eluhc.com/openapi/transfer/shopAsyncPointsController';
        $data =[
            'user_id' => $cash_order['user_id'],
            'trade_type' => $cash_order['trade_type'],
            'amount' => $cash_order['amount']
        ]; 
        $ret = request_url($url,$data,'POST');
        //根据返回码,如果错误则抛错
        // Log::info(json_encode($ret));
        if($ret['code']!= '0000'){
            err('request_url请求错误');
        }
        return $next($request);
    }
}