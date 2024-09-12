<?php
namespace app\test\repo;

use app\test\model\Test;

class TestRepo {
    public $model;
    
    public function __construct(Test $test)
    {
        $this->model = $test;
    }

    public function getRecord($id)
    {
        return $this->model->where("id",$id)->find();
        
    }

}