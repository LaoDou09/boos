<?php

namespace app\api\controller\userinfo;

use app\api\service\user\UserLevelService;
use app\common\controller\Api;

class UserLevel extends Api {

    protected $noNeedRight = '*';

    public function getLevelList (){
        $service = app(UserLevelService::class);
        $this->ok($service->getLevelList());
    }

    public function getLevelById(){
        $service = app(UserLevelService::class);
        $this->ok($service->getLevelById($this->request->post('id')));
    }

    //购买等级
    public function buyLevel(){
        //验证参数
        $rule = [
            'id' =>'require',
            'promotion_code' =>'require'
        ];
        $data = [
            'id' =>$this->request->post('id'),
            'promotion_code' =>$this->request->post('promotion_code')
        ];

        $ret = $this->validate($data,$rule);
        if($ret != 1){
            err($ret);
        }
        $service = app(UserLevelService::class);
        $this->ok($service->buyLevel($data));
    }

}