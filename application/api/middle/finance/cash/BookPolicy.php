<?php
namespace app\api\middle\finance\cash;

use app\admin\model\finance\FinanceBookPolicy;
use Closure;
use tools\service\Middleware;

class BookPolicy implements Middleware{

    public function handle($request,Closure $next){
        //根据book_code找到bean执行后替换code
        //todo 
        $records = model(FinanceBookPolicy::class)
            ->where('book_code',$request['book_code'])
            ->where('status','00')
            ->order('sort','asc')
            ->select();
        $code = $request['book_code'] ;
        foreach($records as $record){
            $ret = service()
                ->pass($record)
                ->middle($record['policy_bean'])
                ->run();
            if($ret){
                $code = $record['response_code'];  
            }
        }
        $request['code'] = $code;
        return $next($request);
    }
}