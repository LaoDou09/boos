<?php
namespace app\api\middle\finance\cash;

use app\admin\model\finance\FinanceBookOrderHistory;
use Closure;
use think\Log;
use tools\service\Middleware;

class UpdateCashOrder implements Middleware {
    public function handle($request, Closure $next)
    {

        //状态标记好之后,删除cash_order,插入到cash_order_history中

        $cash_order = $request['cash_order'];
        $cash_order['status'] = config('site.finance_cash_status')['sucess'];
        // $history = model(FinanceBookOrderHistory::class);
        // foreach($cash_order as $key=>$value ){
        //     $history[$key] = $value;
        // }
        // $history->isUpdate(false)->save();
        $cash_order->isUpdate(true)->save();
        return $next($request);
    }
}