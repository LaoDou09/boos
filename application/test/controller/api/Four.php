<?php
namespace app\test\controller\api;
use app\common\controller\Api;
use app\test\model\Test;
use app\test\service\TestModelService;
use app\test\service\TestService;

class Four extends Api{
    public $noNeedLogin = ['*'];
    
    public function test1(){
        $ret = app(TestService::class)->test1("1");
        $this->ok($ret);
    }
    
    public function test2()
    {
       $ret = app()->make(TestModelService::class)->test('1');
       $this->ok($ret);
    }
    public function test3(){
        $ret = Test::all();
        $this->ok($ret);
    }
    public function test4(){
        $ret = model(Test::class)->where('id','>=',1)->where('user_id',1)->select();
        foreach($ret as $record){
            dd($record->tags);
        }
        $this->ok($ret);
    }
    public function test5(){
        $record = model(Test::class)->find(2);
        $record->tags = "早上11111111大发噶士大夫";
        $record->user_id = 1 ;
        $record->isUpdate(true)->save();
        $this->ok($record);
    }
    public function test6(){
        $record = model(Test::class);
        $record['user_id'] = 1;
        $record['tags'] = "asfasdfasdfasdf";
        $record->isUpdate(false)->save();
        $this->ok($record);
    }

}