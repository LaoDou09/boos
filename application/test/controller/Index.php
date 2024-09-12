<?php
namespace app\test\controller;

use app\common\controller\Api;

class Index extends Api {
    // public $noNeedLogin = ['*'];
    public function index(){
        $this->ok("");
    }
}