<?php
namespace app\test\controller\admin;

use app\common\controller\Backend;

//http://base_url/test/admin/test/test
class Test extends Backend {
    
    public $noNeedLogin = ['*'];
    
    public function test(){
        echo "test";
    }
    
    
}