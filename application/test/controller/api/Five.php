<?php
namespace app\test\controller\api;


use app\common\controller\Api;
use think\Hook;
use think\Log;

class Five extends Api {
    public $noNeedLogin = ['*'];
    //这里是测试Hook执行的
    public function test(){
        $request = [
            'aa' =>'bb',
            'bb' =>'cc'
        ];
        Log::info('test hook start!!!!!!!!!');
        //在tags中标注了2个hooker侦听被执行，按顺序
        Hook::listen('test_hook',$request);
        //request作为引用 被listen的执行，因此request中有run的数据
        $this->ok($request);    
    }
    
    
}