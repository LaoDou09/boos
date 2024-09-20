<?php

namespace app\api\controller\finance;

use app\admin\model\finance\FinanceBookOrder as BookOrder;
use app\common\controller\Api;

class FinanceBookOrder extends Api {

    protected $noNeedRight = '*';

    public function getBookOrder(){
        $page = $this->request->post('page');
        $page = $page?$page:1;
        $userInfo = getUserInfo();
        $orders = model(BookOrder::class)
            ->where('process_id',$userInfo['user_id'])
            ->limit($page,10)
            ->order('id','desc')
            ->select();
        $this->ok($orders);
    }

}