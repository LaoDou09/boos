<?php

namespace app\api\middle\finance\cash;

use app\api\library\Sign;
use Closure;
use think\Log;
use tools\service\Middleware;

class CashOrderProcess implements Middleware {

    public function handle($request,Closure $next){

        Log::info("-----记录收银单-----");
        //收银前策略
        $request = service()->pass($request)->middle(BeforeCashOrder::class)->run();

        $request = $this->saveCashOrder($request);
        //收银后策略
        $request = service()->pass($request)->middle(AfterCashOrder::class)->run();
        return $next($request);
    }

    public function saveCashOrder($request){
        //$cash_order是一个model, 前面入口时已经整理,
        $cash_order = $request['cash_order'];
        $cash_order['book_code'] = $request['code'];
        $cash_order['status'] = config('site.finance_cash_status')['begin'];
        $cash_order['sign'] = Sign::makeCashSign($cash_order);
        
        //保存数据库,添加新纪录
        
        $cash_order->isUpdate(false)->save();
        $request['cash_order'] = $cash_order;
        return $request;
    }

}