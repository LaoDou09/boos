<?php
namespace app\test\controller\api;

use app\common\controller\Api;
use think\Log;

class Seven extends Api {

    public $noNeedLogin = ['*'];

    public function test1(){
        Log::info('ok');
        Log::error('this is a errror');
        $this->ok('ok');
    }

}