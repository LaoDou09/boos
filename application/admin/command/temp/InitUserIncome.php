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
        $account_type ='10';
        $book_code = 'K9001';
        $records = model(FinanceBookOrder::class)
            ->where('account_type',$account_type)
            ->where('book_code',$book_code)
            ->where('status','00')
            ->where('account_object','80')
            ->field('process_id,SUM(debit_amount) as sum_debit ,SUM(credit_amount) as sum_credit')
            ->group('process_id')
            ->select();

        $levelSystem = model(UserLevelSystem::class)->where('level_key','user_level')->select();


        foreach($records as $record){
            if($record['process_id'] != '1142889689825594113'){
                $userInfo = model(UserInfo::class)->getByUserId($record['process_id']);
                $amount = $record['sum_credit'];
                $data = model(ReportUserIncome::class);
                $data['user_id'] = $record['process_id'];
                $data['user_name'] = $userInfo['user_name'];
                $data['promotion'] = $amount;
                $data['limit'] = $this->getLimit($userInfo,$levelSystem);
                $output->info(json_encode($data));
                $data->isUpdate(false)->save();
            }
        }
        
    }

    public function getLimit($userInfo,$levelSystem){
        foreach($levelSystem as $v){
            if($v['code']==$userInfo['user_level']){
                return $v['price3'];
            }
        }
    }
}