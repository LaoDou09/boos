<?php

namespace app\admin\command\crontab;

use app\admin\model\finance\FinanceCashOrder;
use app\admin\model\user\UserInfo;
use app\admin\model\user\UserLevelDict;
use app\admin\model\user\UserReleaseCoupon;
use app\api\service\finance\FinanceCashService;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Log;

class ReleaseCoupon extends Command {
    public $dict;

    protected function configure()
    {
        $this->setName('ReleaseCoupon')
            ->setDescription('Do At 1:00 Everyday');
    }

    protected function execute(Input $input, Output $output)
    {
        $this->dict = model(UserLevelDict::class)->where('level_key','user_level')->select();
        Log::info("ReleaseCoupon Start");
        model(UserReleaseCoupon::class)->where('next_date',date('Y-m-d'))
            ->chunk(10,function($records)use($output){
            
            foreach($records as $record){
              try {
                $result = $this->releaseCoupon($record,$output);
                if($result){
                    $result['record']->isUpdate(true)->save();
                    Log::info("释放成功::".$record['user_id']);
                }
              } catch (\Throwable $ex) {
                    Log::info($ex->getMessage());
                    $output->info("释放失败::".$record['user_id']);
                    Log::info("释放失败::".$record['user_id']);
              }
            }
        });
        $output->info("释放完成!");
    }

    private function releaseCoupon($record,$output){
        $user_info = model(UserInfo::class)->getByUserId($record['user_id']);
        $rate = $this->getRate($user_info['user_level']);
        $amount = money()->mul($record['sum_coupon'],$rate);
        if($amount >0  &&  $record['release'] > $amount){
            $cash_order = model(FinanceCashOrder::class);
            $cash_order['user_id'] = $record['user_id'];
            $cash_order['user_name'] = $record['user_name'];
            $cash_order['user_mobile'] = $record['user_name'];
            $cash_order['trade_type'] = 'release_coupon';
            $cash_order['amount'] = $amount;
            app(FinanceCashService::class)->main($cash_order,true);
            $record['release'] = money()->sub($record['release'],$amount);
            $record['finish'] =money()->add($record['finish'],$amount);
            $record['release_times'] = $record['release_times'] + 1;
            $record['next_date'] = date('Y-m-d',strtotime("+1 day"));
            $result = [
                'record' =>$record,
                'amount' =>$amount
            ];
            return $result;
        }
        return null;
    }


    private function getRate($level){
        foreach($this->dict as $val){
            if($val['code'] == $level){
                return $val['coupon_release'];
            }
        }
        return 0;
    }


}