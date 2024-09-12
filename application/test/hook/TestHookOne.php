<?php
namespace  app\test\hook;

use think\Log;

class TestHookOne {
    public function run(&$response)
    {
        Log::info("test hook runing!!!!!!!!!!!!!!");
        $response['test_hook'] =  'test hook do something';
        
    }
}