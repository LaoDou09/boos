<?php

namespace app\api\middle\user;

use app\admin\model\user\UserTeam;
use Closure;
use tools\service\Middleware;

class GetUserTeam implements Middleware {


    public function handle($request, Closure $next)
    {
        $user_info = $request['user_info'];
        $user_team = model(UserTeam::class)->getByUserId($user_info['user_id']);
        $request['user_team'] = $user_team;
        return $next($request);
    }
}