<?php
namespace app\test\controller\api;
use app\common\controller\Api;
use app\test\job\DemoJob;
use app\test\job\DemoJob2;
use think\Cache;
use think\Queue;

class Three extends Api{
    public $noNeedLogin = ['*'];
    
    public function test1() {
        $redis = redis(8);
        $redis->set("aaa","bbb");
        $this->success("ok",$redis->get("aaa"));
        
    }
    
    //根据config.php中的'type'   => 'File',配置，
    //目前缓存在runtime/cache 中的文件中
    public function test2(){
        Cache::set("bbb","cc");
        $this->success('ok',Cache::get('bbb'));
    }
    
    public function queue() {
        $data = [
            'aa' =>'bb',
            'bb' =>'cc'
        ];
        
        //php think queue:listen --queue queue_car_mall
        //默认listen侦听队列为queue，因此需要加名称
        //默认发送队列是queue.conf配置文件中的default
        //发到DemoJob 则有job的fire侦听接收工作
        Queue::push(DemoJob::class,$data);
        Queue::push(DemoJob2::class,"11111");
        $this->success('ok',$data);
    } 
    
}