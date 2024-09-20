<?php

namespace app\api\controller\report;

use app\api\service\report\UserReportService;
use app\common\controller\Api;

class UserReport extends Api{

    protected $noNeedRight = '*';

    public function getUserKpi(){
        $user_info = getUserInfo();
        $ret = app(UserReportService::class)->calcUserKpi($user_info['user_id']);
        $this->ok($ret);
    }


}