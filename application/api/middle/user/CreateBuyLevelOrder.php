<?php

namespace app\api\middle\user;

use app\admin\model\user\UserLevelSaleOrder;
use Closure;
use tools\service\Middleware;

class CreateBuyLevelOrder implements Middleware {


    public function handle($request, Closure $next)
    {
        $level_system = $request['level_system'];

        $userInfo = $request['user_info'];
        
        //下单,直接余额支付
        $order = model(UserLevelSaleOrder::class);
        $order['title'] = $level_system['title'];
        $order['user_id'] = $userInfo['user_id'];
        $order['login_name'] = $userInfo['login_name'];
        $order['user_name'] = $userInfo['user_name'];

        $order['trade_type'] = $level_system['trade_type'];
        $order['level_key'] = $level_system['level_key'];
        $order['code'] = $level_system['code'];

        $order['account_type1'] = $level_system['account_type1'];
        $order['price1'] = $level_system['price1'];
        $order['account_type2'] = $level_system['account_type2'];
        $order['price2'] = $level_system['price2'];
        $order['account_type3'] = $level_system['account_type3'];
        $order['price3'] = $level_system['price3'];


        $promotion = $request['promotion'];
        if($promotion != ''){
            $order['promotion_code'] = $promotion['promotion_code'];
            $order['promotion_user_id'] = $promotion['user_id'];
            $order['promotion_login_name'] = $promotion['login_name'];
        }

        //10 下单
        $order['status'] = "10";
        $order['expire_time'] = date('Y-m-d H:i:s', strtotime('+10minute'));

        $order->isUpdate(false)->save();
        $request['level_sale_order'] = $order;
        return $next($request);
    }
}