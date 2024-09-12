<?php

namespace app\api\service\user;

use app\admin\model\user\UserLevelSystem;
use app\api\middle\user\BuildReleaseCoupon;
use app\api\middle\user\CheckBuyLevelRisk;
use app\api\middle\user\CreateBuyLevelOrder;
use app\api\middle\user\CreateUserTeam;
use app\api\middle\user\PayBuyLevelOrder;
use app\api\middle\user\UpdateBuyLevelOrder;
use app\api\middle\user\UpdateUserLevel;


class UserLevelService {


    public function getLevelList(){
        $model = model(UserLevelSystem::class);
        return $model->all();
    }

    public function getLevelById($id){
        $model = model(UserLevelSystem::class);
        $ret = $model->where('id',$id)->find();
        return $ret;
    }

    public function buyLevel($data){

        //先进行风控检查
        $request = [
            'user_info' =>getUserInfo(),
            'level_system' => $this->getLevelSystem($data['id']),
            'promotion_code' =>$data['promotion_code']
        ];
        $request = service()
            ->pass($request)
            //风控中检查推荐关系
            ->middle(CheckBuyLevelRisk::class)
            //创建团队关系
            ->middle(CreateUserTeam::class)
            //生成购买流水
            ->middle(CreateBuyLevelOrder::class)
            //支付购买流水
            ->middle(PayBuyLevelOrder::class)
            //更新流水状态
            ->middle(UpdateBuyLevelOrder::class)
            //更新用户等级
            ->middle(UpdateUserLevel::class)
            //组建打车卷数据释放
            ->middle(BuildReleaseCoupon::class)
            ->runTransaction();
        return $request['level_sale_order']['id'];
    }

    private function getLevelSystem($id){
        $record = model(UserLevelSystem::class)->getById($id);
        if(!$record){
            err("没有相应的会员等级");
        }
        return $record;
    }


}