<?php

namespace app\api\service\user;

use app\admin\model\user\UserLevelSystem;
use app\api\middle\user\BuildReleaseCoupon;
use app\api\middle\user\CheckBuyLevelAgain;
use app\api\middle\user\CheckBuyLevelRisk;
use app\api\middle\user\CreateBuyLevelOrder;
use app\api\middle\user\CreateUserIncome;
use app\api\middle\user\CreateUserTeam;
use app\api\middle\user\GetUserTeam;
use app\api\middle\user\PayBuyLevelOrder;
use app\api\middle\user\UpdateBuyLevelOrder;
use app\api\middle\user\UpdateUserIncomeLimit;
use app\api\middle\user\UpdateUserLevel;
use think\Log;

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
        Log::info('用户等级购买');
        //先进行风控检查
        $user_info = getUserInfo();
        $request = [
            'user_id' => $user_info['user_id'],
            'user_info' =>$user_info,
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
            //增加用户收入统计记录表
            ->middle(CreateUserIncome::class)

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

    public function buyLevelAgain($id){
        Log::info('用户复购');
        $user_info = getUserInfo();
        $request = [
            'user_id' => $user_info['user_id'],
            'user_info' =>$user_info,
            'level_system' => $this->getLevelSystem($id),
            'promotion' =>''

        ];

        $request = service()
            ->pass($request)
           //风控中检查收入上限
            ->middle(CheckBuyLevelAgain::class)
            ->middle(GetUserTeam::class)
            //生成购买流水
            ->middle(CreateBuyLevelOrder::class)
            //支付购买流水
            ->middle(PayBuyLevelOrder::class)
            //更新流水状态
            ->middle(UpdateBuyLevelOrder::class)
            //更新用户等级
            ->middle(UpdateUserLevel::class)
            //更新收入限额
            ->middle(UpdateUserIncomeLimit::class)

            ->runTransaction();
        return $request['level_sale_order']['id'];
    }


}