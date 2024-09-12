<?php

namespace app\api\middle\finance\cash;
use Closure;
use think\Log;
use tools\service\Middleware;

class GetBookCode implements Middleware{

    public function handle($request, Closure $next)
    {
        $trade_type = $request['cash_order']['trade_type'];
        Log::info("-----交易换记账码-----::".$trade_type);
        //系统配置->字典配置增加trade_type分组,并增加变量,例如充值: top_up
        //生效后,会保存在extra下的site.php中,数据库中也有保存
        $book_code = config('site.'.$trade_type);
        if($book_code == null){
            err('该交易类型无记账码,不可收银');
        }
        Log::info("-----记账码-----::".$book_code);
        $request['book_code'] = $book_code;
        return $next($request);
    }
}