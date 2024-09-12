<?php
namespace app\test\job;
use think\Log;
use think\queue\Job;

class DemoJob {
    public $delay = 60;
    public function fire(Job $job, $data){
    
        //....这里执行具体的任务
        Log::info('demo job start !!!!!!!!!!!!!!!!!!!');
        var_dump($job->getQueue());
        var_dump($data);
        
        //最后
        $job->delete();
    }
    
    public function handle($job)
    {
        if ($job->attempts() > 3) {
            //通过这个方法可以检查这个任务已经重试了几次了
            echo "333333333";
        }
      //如果任务执行成功后 记得删除任务，不然这个任务会重复执行，直到达到最大重试次数后失败后，执行failed方法
      $job->delete();
        echo "okkkkkkkkkkkkkkkkk";
      // 也可以重新发布这个任务
      //      $job->release($this->delay); //$delay为延迟时间
    }
    
    public function failed($data){
    
        // ...任务达到最大重试次数后，失败了
    }
}