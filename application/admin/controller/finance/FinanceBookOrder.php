<?php

namespace app\admin\controller\finance;

use app\common\controller\Backend;

/**
 * 记账凭证管理
 *
 * @icon fa fa-circle-o
 */
class FinanceBookOrder extends Backend
{

    /**
     * FinanceBookOrder模型对象
     * @var \app\admin\model\finance\FinanceBookOrder
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\finance\FinanceBookOrder;
        $this->assignModelOption('model_options',\app\admin\model\finance\FinanceBookOrder::$options);
        $this->view->assign("statusList", $this->model->getStatusList());
    }



    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    public function add(){$this->error();}
    public function edit($ids = NULL){$this->error();}
    public function del($ids = NULL){$this->error();}
    public function multi($ids = NULL){$this->error();}

    public function index(){
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField')) {
                return $this->selectpage();
            }

            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model->where($where)->count();
            $list = $this->model->where($where)->order($sort,$order)->limit($offset,$limit)->select();
            $list = collection($list)->toArray();

            //增加一行数据
            $sum_field = 'SUM(debit_amount) as debit_amount ,SUM(credit_amount) as credit_amount';
            $sum = $this->model->where($where)->field($sum_field)->find();
            $sum = $sum?($sum->toArray()):[];
            $sum['id'] = '合计';
            $sum['remark']='';
            $list[] = $sum;
            $result = array("total" => $total, "rows" => $list);
            return json($result);
            
        }
        return $this->view->fetch();
    }



}
