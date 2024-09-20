<?php

namespace app\admin\controller\report;

use app\api\service\report\UserReportService;
use app\common\controller\Backend;


class UserReport extends Backend {

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\user\UserInfo;
    }

    public function index(){

        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = 0;

            $list = [];
            $param = $this->request->param('search');
            //为了节省查询,没有search的时候,不给数据
            if($param){
                //todo这里慢慢修改成like
                $list = $this->model
                    ->where('user_id',$param)
                    ->whereor('user_name',$param)
                    ->order($sort,$order)
                    ->limit($offset,$limit)->select();
                $list = collection($list)->toArray();
                $total = $this->model->where($where)->count();
                //实际只有一条数据
                foreach($list as &$v){
                    $ret = app(UserReportService::class)->calcUserKpi($v['user_id']);
                    $v['u1010'] = $ret['u1010'];
                    $v['u1020'] = $ret['u1020'];
                    $v['u1030'] = $ret['u1030'];
                    $v['kpi_today'] = $ret['kpi_today'];
                    $v['kpi_month'] =$ret['kpi_month'];
                    $v['kpi_all'] =$ret['kpi_all'];
                }
            }
            $result = array("total" => $total, "rows" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

 
}