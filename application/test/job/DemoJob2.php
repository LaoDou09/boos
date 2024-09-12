<?php
namespace app\test\job;

use think\Log;
use think\queue\Job;

class DemoJob2 {
    public $delay = 60;
    public function fire(Job $job, $data){

        Log::info('demo job2222222222222 start !!!!!!!!!!!!!!!!!!!');

        var_dump($data);

        $job->delete();

    }
}