<?php

use app\admin\model\user\UserInfo;
use app\common\library\Auth;
use think\Config;
use think\Env;
use think\exception\HttpResponseException;
use think\Log;
use think\Request;
use think\Response;
use tools\Errors;
use tools\IdWorker;
use tools\jwt\Claims;
use tools\jwt\Token;
use tools\Money;
use tools\service\Service;

if (!function_exists('err')) {
    function err($msg = '', $code = 9999, $url = null, $data = '', $wait = 3, array $header = [])
    {
        Log::error($msg);
        // 如果未设置类型则使用默认类型判断
        $type = 'json'; 
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'time' => Request::instance()->server('REQUEST_TIME'),
            'data' => $data,
        ];

        $code = $code >= 1000 || $code < 200 ? 200 : $code;
        $response = Response::create($result, $type, $code)->header($header);
        throw new HttpResponseException($response);
    } 
}

if (!function_exists('ID')) {
    function ID(): string
    {
        $worker = new IdWorker();
        return $worker->getId();
    }
}
if(!function_exists('JwtToken')){
    function JwtToken(Claims $claims = null): Token
    {
        $claims = $claims==null ? new Claims() : $claims;
        return new Token($claims);
        
    }
}

if(!function_exists('dd')){
    function dd($param){
        err('debug',9000,'',$param);
    }
}
if (!function_exists('redis')) {
    function redis($select = 0){
        $options = config('redis');
        
        $options['select'] = $select;
        if (!extension_loaded('redis')) {
            throw new \BadFunctionCallException('not support: redis');
        }
        if (!empty($options)) {
            $options = array_merge($options, $options);
        }
        $redis = new \Redis;
        if (isset($options['persistent']) && $options['persistent']) {
            $redis->pconnect($options['host'], $options['port'], $options['timeout'], 'persistent_id_' . $options['select']);
        } else {
            $redis->connect($options['host'], $options['port'], $options['timeout']);
        }

        if ('' != $options['password']) {
            $redis->auth($options['password']);
        }

        if (0 != $options['select']) {
            $redis->select($options['select']);
        }
        return $redis;
    }
}

if(!function_exists('service')){
    function service($service = null): Service{
        return new Service($service);
    }
}
if(!function_exists('app')){
    function app($name=null) {
        $container = \tools\service\Container::getInstance();
        if($name != null) return $container->make($name);
        else return $container;
    }
}

if (!function_exists('request_url')) {

    //举例如下
    // $url = api_domain('user/getBalanceByAccountType');
    // $result = request_url($url, [
    //     'account_type' => 60
    // ],'POST',['token:'.$token]);
    // if($result && $result['code'] == '0000'){
    //     $green_point = $result['data']['balance'];
    // }

    function request_url($url, $data, $method = 'POST', $header = [], $json = true)
    {
        $header_init = [
            'Content-type:application/json',
        ];
        if ($json) {
            $header = array_merge($header_init, $header);
            $data = json_encode($data);
        }

        $ch = curl_init(); //初始化CURL句柄
        curl_setopt($ch, CURLOPT_URL, $url); //设置请求的URL
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); //设为TRUE把curl_exec()结果转化为字串，而不是直接输出
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, strtoupper($method)); //设置请求方式
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);//设置提交的字符串
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output, true);
    }

    if (!function_exists('api_domain')) {
        function api_domain(string $path)
        {
            if (strpos($path, 'http://') !== false || strpos($path, 'https://') !== false) return $path;
    
            if (empty($path)) return '';
            return Env::get('app.api_domain') . '/' . $path;
        }
    
    }
    if (!function_exists('getRandStr')) {

        function getRandStr($length){
            $str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
            $randStr = str_shuffle($str);//打乱字符串
            $rands= substr($randStr,0,$length);//substr(string,start,length);返回字符串的一部分
            return $rands;
           }
    }
    if (!function_exists('money')) {
        function money(){
            return new Money();
        }
    }

    if (!function_exists('getUserInfo')) {
        function getUserInfo(){
            $id = Auth::instance()->getUser()->id;
            $data =  model(UserInfo::class)->getById($id);
            return $data;
        }
    }
    
}