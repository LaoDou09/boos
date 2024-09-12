<?php
namespace app\api\job\finance;

use app\api\service\finance\FinanceBalanceService;
use Exception;
use think\Log;
use think\queue\Job;


class UpdateBalanceJob {


    public $delay = 60;
    public function fire(Job $job, $data){
        Log::info('-----Update Balance Job -----');
        try{
            app(FinanceBalanceService::class)->updateBalance($data);
        }catch(Exception $e){
            Log::info("余额更新错误::".$e->getMessage());
        }
        
        $job->delete();
    }
}