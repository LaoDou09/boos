<?php
namespace app\test\service;

use app\test\repo\TestRepo;

class TestService {
    public $repo;
    public function __construct(TestRepo $repo)
    {
        $this->repo = $repo;
    }

    public function handle($request){
        $request['handle']=$this->test1('1');
        return $request;
    }
    public function handle2($request){
        $request['handle2']="handle2";
        return $request;
    }  
    public function test1($id)
    {
        return $this->repo->getRecord($id);
    }
    
    
}