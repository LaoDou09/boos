<?php
namespace app\api\service\finance;

use app\admin\model\finance\FinanceCashOrder;
use app\api\middle\finance\cash\BookOrderProcess;
use app\api\middle\finance\cash\BookPolicy;
use app\api\middle\finance\cash\CashOrderProcess;
use app\api\middle\finance\cash\GetBookCode;
use app\api\middle\finance\cash\RiskCheck;
use app\api\middle\finance\cash\SendBalanceQueue;
use app\api\middle\finance\cash\UpdateCashOrder;
use think\Log;

class FinanceCashService {


    public function entry ($request,$risk_check = true)
    {
        //整理接口参数,要求传递的金额一律为分,无小数点
        $cash_order = model(FinanceCashOrder::class);
        //必须------------------
        $cash_order->user_id = $request['user_id'];
        $cash_order->trade_type = $request['trade_type'];
        //合计金额,应该判断整数
        $cash_order->amount = $request['amount'];

        //非必须----------------
        $cash_order->user_name = $request['user_name'];
        $cash_order->user_mobile = $request['user_mobile'];
        $cash_order->relation_id = $request['relation_id'];
        //如果有交易金额
        if($request['trans_amt']){
            $cash_order->trans_amt = $request['trans_amt'];
            $cash_order->discount = $request['discount'];
        }else{
            $cash_order->trans_amt = $request['amount'];
            $cash_order->discount = 0;
        }
        $cash_order->to_user_id = $request['to_user_id'];
        $cash_order->to_user_name = $request['to_user_name'];
        //多种币种的,应该在这里填写
        // $detail = [
        //     [
        //         'account_type' =>'20',
        //         'amount'=>'3434'
        //     ],
        //     [
        //         'account_type' =>'30',
        //         'amount'=>'123'
        //     ],  
        // ];
        $cash_order->details = $request['details'];
        $cash_order->remark = $request['remark'];

        return $this->main($cash_order,$risk_check);
    }


    public function main(FinanceCashOrder $cash_order,$risk_check = true){
        $request['user_id'] = $cash_order['user_id'];
        $request['cash_order'] = $cash_order; 
        $request['risk_check'] = $risk_check;
        $result = service(FinanceCashService::class)
            ->pass($request)
            //根据交易类型获取记账码
            ->middle(GetBookCode::class)
            //风控检查
            ->middle(RiskCheck::class)
            // 记账策略,转换记账码等
            ->middle(BookPolicy::class)
            //记录收银单 
            ->middle(CashOrderProcess::class)
            //生成记账流水
            ->middle(BookOrderProcess::class)
            ->runTransaction();
        
        return $result;
    }

    //main中的中间件跑完后走这里
    public function handle($request){
        Log::info("-----发送队列-----");
        $request = service()
            ->pass($request)
            //更新收银流水状态:风控错误等
            ->middle(UpdateCashOrder::class)
            //发送更新余额队列redis queue
            ->middle(SendBalanceQueue::class)
            ->run();
        return $request;
    }


}