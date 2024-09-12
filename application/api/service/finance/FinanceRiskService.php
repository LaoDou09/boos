<?php
namespace app\api\service\finance;

use app\admin\model\finance\FinanceRiskTemplate;
use think\Log;

class FinanceRiskService {


    public function check($book_code,$request){
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

