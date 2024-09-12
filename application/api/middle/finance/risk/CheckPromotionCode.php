<?php

namespace app\api\middle\finance\risk;

use app\admin\model\user\UserInfo;
use Closure;
use tools\service\Middleware;

class CheckPromotionCode implements Middleware {
    use GetRisk;

    public function handle($request, Closure $next)
    {
        // $template = $this->getRiskTemplate($request['risks'],get_class());
        $user_info = model(UserInfo::class)->where('promotion_code',$request['promotion_code'])->find();
        if(!$user_info){
            err('推荐码不存在');
        }
        $request['promotion'] = $user_info;
        return $next($request);
    }
}