<?php

namespace app\api\middle\user;

use Closure;
use tools\service\Middleware;

class UpdateUserLevel implements Middleware {

    public function handle($request, Closure $next)
    {
        
        $user_info = $request['user_info'];
        $order = $request['level_sale_order'] ;
        if($order['level_key'] == 'user_level'){
            $user_info['user_level'] = $order['code'];
        }
        $user_info->isUpdate(true)->save();
        return $next($request);
    }
}