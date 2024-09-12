<?php
namespace app\test\controller\api;

use app\test\middle\MiddleOne;
use app\test\middle\MiddleThree;
use app\test\middle\MiddleTwo;
use app\common\controller\Api;
use app\test\service\TestService;

class Two extends Api{
    protected $noNeedLogin = ['*'];
    
    //最后运行TestService的handle方法
    public function test1() {
        $request['test'] = 'test';
        $ret = service(TestService::class)
            ->pass($request)
            ->middle(MiddleOne::class)
            ->middle(MiddleTwo::class)
            ->middle(MiddleThree::class)
            ->run();
        $this->ok($ret);
    }
    //最后运行TestService的handle方法
    public function test2() {
        $request['test'] = 'test';
        $ret = service(TestService::class)
            ->pass($request)
            ->middle(MiddleOne::class)
            ->middle(MiddleTwo::class)
            ->middle(MiddleThree::class)
            ->run('handle2');
        $this->ok($ret);
    }
    //只运行中间件,可选择事务
    public function test3() {
        $request['test'] = 'test';
        $ret = service()
            ->pass($request)
            ->middle(MiddleOne::class)
            ->middle(MiddleTwo::class)
            ->middle(MiddleThree::class)
            ->runTransaction();
        $this->ok($ret);
    }
}