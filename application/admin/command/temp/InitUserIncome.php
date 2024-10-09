<?php

namespace app\admin\command\temp;

use think\console\Command;
use think\console\Input;
use think\console\Output;
use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\report\ReportUserIncome;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserLevelSystem;

class InitUserIncome extends Command {
 
    protected function configure()
    {
        $this->setName('InitUserIncome');
    
    }

    protected function execute(Input $input, Output $output)
    {
        $levelSystem = model(UserLevelSystem::class)->where('level_key','user_level')->select();

        //把所有userinfo中等级不是U1000的用户找出来,就是购买过等级的用户
        $users = model(UserInfo::class)
            ->where('user_level','neq','U1000')
            ->where('user_id','neq','1142889689825594113')
            ->chunk(200,function($records)use($output,$levelSystem){
                foreach($records as $record){
                    $account_type ='10';
                    $book_code = 'K9001';
                    $sum = model(FinanceBookOrder::class)
                        ->where('account_type',$account_type)
                        ->where('book_code',$book_code)
                        ->where('process_id',$record['user_id'])
                        ->where('status','00')
                        ->where('account_object','80')
                        ->sum('credit_amount');
                        $data = model(ReportUserIncome::class);
                        $data['user_id'] = $record['user_id'];
                        $data['user_name'] = $record['user_name'];
                        $data['promotion'] = $sum;
                        $data['limit'] = $this->getLimit($record,$levelSystem);
                        $data['blind_limit'] = $this->getBlindLimit($record,$levelSystem);

                        $output->info(json_encode($data));
                        $data->isUpdate(false)->save();
                }

            });
    }

    public function getLimit($userInfo,$levelSystem){
        foreach($levelSystem as $v){
            if($v['code']==$userInfo['user_level']){
                return $v['price3'];
            }
        }
    }
    public function getBlindLimit($userInfo,$levelSystem){
        foreach($levelSystem as $v){
            if($v['code']==$userInfo['user_level']){
                return $v['rights5'];
            }
        }
    }
}