<?php
namespace  app\test\hook;

use think\Log;

class TestHookTwo {
    public function run(&$response)
    {
        $response['test_hook'] =  '被hook2修改了';
        Log::info("test hook2 runing!!!!!!!!!!!!!!");
        $response['test_hook2'] =  'test2按顺序执行';
        
    }
}