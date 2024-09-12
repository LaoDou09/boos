<?php

namespace app\api\middle\user;

use app\admin\model\user\UserTeam;
use Closure;
use tools\service\Middleware;

class CreateUserTeam implements Middleware {


    public function handle($request, Closure $next)
    {

        $update = false;
        $user_info = $request['user_info'];
        $promotion = $request['promotion'];
        $user_team = model(UserTeam::class)->getByUserId($user_info['user_id']);

        if($user_team != null){
            //如果有了团队关系,这里暂时为更新....
            $update = true;
        }else{
            $user_team = model(UserTeam::class);
        }
        $parent_team = model(UserTeam::class)->where('user_id',$promotion['user_id'])->find();
        $user_team['user_id'] = $user_info['user_id'];
        $user_team['user_name'] = $user_info['user_name'];
        $user_team['login_name'] =  $user_info['login_name'];

        $user_team['parent1'] = $parent_team['user_id'];
        $user_team['parent2'] = $parent_team['parent1'];
        $user_team['parent3'] = $parent_team['parent2'];
        $user_team['parent4'] = $parent_team['parent3'];
        $user_team['parent5'] = $parent_team['parent4'];
        if($parent_team['path']){
            $user_team['path'] = $parent_team['path'].','.$parent_team['user_id'];
        }else{
            $user_team['path'] = $parent_team['user_id'];
        }
        $user_team->isUpdate($update)->save();
        $request['user_team'] = $user_team;
        return $next($request);
    }
}