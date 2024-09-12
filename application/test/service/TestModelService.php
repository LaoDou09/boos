<?php

namespace app\test\service;

use app\test\model\Test;

class TestModelService {
    public $model ;
    
    public function __construct(Test $test)
    {
        $this->model = $test;
    }
    public function test($id){
        return $this->model->where('id',$id)->find();
    }
}