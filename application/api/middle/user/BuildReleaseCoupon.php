<?php

namespace app\api\middle\user;

use app\admin\model\user\UserReleaseCoupon;
use Closure;
use tools\service\Middleware;

class BuildReleaseCoupon implements Middleware {


    public function handle($request, Closure $next)
    {   
        $order = $request['level_sale_order'] ;
        $update = false;
        $release = model(UserReleaseCoupon::class)->where('user_id',$order['user_id'])->find();
        if($release){
            $update =true;
        }else{
            $release = model(UserReleaseCoupon::class);
        }
        $release['user_id'] = $order['user_id'];
        $release['user_name'] = $order['user_name'];

        //总打车卷->等于交易金额
        if($order['account_type2'] == '10'){
             $release['sum_coupon'] = $order['price2'];
        }else if($order['account_type3'] == '10'){
             $release['sum_coupon'] = $order['price3'];
        }else{
             $release['sum_coupon'] = $order['price1'];
        }
        
        $release['release'] = money()->div($release['sum_coupon'],2);
        $release['freeze'] = $release['release'];
        $release['finish'] = 0;
        $release['release_times'] = 0;
        $release['next_date'] = date('Y-m-d',strtotime("+1 day"));
        //每日统计
        $release['u1010'] = 0;
        $release['u1020'] = 0;
        $release['u1030'] = 0;
        $release->isUpdate($update)->save();
        $request['release'] = $release;
        return $next($request);
    }
}