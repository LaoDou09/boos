<?php
namespace app\api\service\finance;

use app\admin\model\finance\FinanceBlackList;
use app\admin\model\finance\FinanceRiskTemplate;

class FinanceRiskService {

    //风控检查入口
    public function check($book_code,$request){

        //黑名单检查
        $black = model(FinanceBlackList::class)
            ->where('user_id',$request['user_id'])
            ->where('book_code',$book_code)
            ->find();
        if($black){
            err($black['title']);
        }
        //风控模板
        $risks = model(FinanceRiskTemplate::class)
            ->where('book_code',$book_code)
            ->where('status','00')
            ->order('sort','asc')
            ->select();

        $middle = [];
        foreach($risks as $k=>$record){
            $middle[$k] = $record['risk_bean'];
        }
        // Log::info("risk check service :: ".json_encode($middle));
        $request['risks'] = $risks;
        $request =service()
            ->pass($request)
            ->setMiddleware($middle)
            ->run();
        return $request;
    }

}

