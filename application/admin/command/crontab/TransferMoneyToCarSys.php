<?php

namespace app\admin\command\crontab;

use app\admin\model\finance\FinanceBookOrder;
use app\admin\model\finance\FinanceCashOrder;
use app\api\service\finance\FinanceCashService;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Log;

class TransferMoneyToCarSys extends Command {


    protected function configure()
    {
        $this->setName('TransferMoneyToCarSys')
            ->setDescription('Do At 2:00 Everyday');
    }


    protected function execute(Input $input, Output $output)
    {
        //转移余额
        $this->transfer($output,'10');
        //转移冻结打车卷
        $this->transfer($output,'91');
    }

    private function transfer (Output $output,$account_type){
        //转移相应数量到carsys
        $records = $this->getBookRecordsSum($account_type);
        foreach($records as $record){
            //如果收入大于支出,才做转移
            $amount = money()->sub($record['sub_credit'] , $record['sub_debit'] );
            if($amount && $record['process_id']!='1142889689825594113'){
                try {
                    $this->callCashService($record,$account_type,$amount);
                    $content = $record['process_id'].'::'.$account_type.'转移成功';
                    $output->info($content);
                } catch (\Throwable $th) {
                    $output->info($th->getMessage());
                    $content = $record['process_id'].'::'.$account_type.'转移失败';
                    $output->info($content);
                    Log::info($content);
                    break;
                    // continue;
                }
            }
        }
    }

    //计算记账流水中有收入的账单合计
    private function getBookRecordsSum($account_type){
        //每天统计记账流水表中6天前的 成功记账数据
        $time = date('Y-m-d',strtotime('-6 day'));
        //group 不支持chunk,因此一次性查出
        //因为本次的转移影响了额度,因此考虑 记账码,
        if($account_type =='10'){
            $book_code = 'K9001';
        }else if ($account_type == '91'){
            $book_code = 'K8001';
        }
        $records = model(FinanceBookOrder::class)
            ->where('account_type',$account_type)
            ->where('book_code',$book_code)
            ->where('status','00')
            ->where('account_object','80')
            ->whereTime('create_time',$time)
            ->field('process_id,SUM(debit_amount) as sub_debit ,SUM(credit_amount) as sub_credit')
            ->group('process_id')
            ->select();
        return $records;
    }
    private function callCashService($record,$account_type,$amount){
        //去请求财务
        $trade_type = 'transfer_'.$account_type;
        $cash_order = model(FinanceCashOrder::class);
        $cash_order['user_id'] = $record['process_id'];
        $cash_order['trade_type'] = $trade_type;
        $cash_order['amount'] = $amount;
        app(FinanceCashService::class)->main($cash_order,true);
    }
    

}