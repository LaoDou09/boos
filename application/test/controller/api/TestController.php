<?php
namespace app\test\controller\api;
use app\common\controller\Api;

// http://base_url/test/api/test_controller/test
class TestController extends Api{
    public $noNeedLogin = ['*'];
    public function test()
    {
        $this->ok("test");
    }
    
}