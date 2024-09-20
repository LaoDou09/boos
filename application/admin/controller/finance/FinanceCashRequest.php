<?php

namespace app\admin\controller\finance;

use app\admin\model\finance\FinanceCashOrder;
use app\api\service\finance\FinanceCashService;
use app\common\controller\Backend;
use Exception;
use think\Log;

/**
 * 收银申请管理
 *
 * @icon fa fa-circle-o
 */
class FinanceCashRequest extends Backend
{

    /**
     * FinanceCashRequest模型对象
     * @var \app\admin\model\finance\FinanceCashRequest
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\finance\FinanceCashRequest;
        $this->view->assign("statusList", $this->model->getStatusList());
    }

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
            $sum_field = 'SUM(amount) as amount';
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


    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

     public function book($ids){

        //只有审批的才可以
        $data = $this->model->getById($ids);
        if($data['status'] != '30'){
            $this->error('状态类型不对,不可以记账');
        }
        $cash_order = model(FinanceCashOrder::class);
        $cash_order['relation_id'] = $ids;
        $cash_order['user_id'] = $data['user_id'];
        $cash_order['user_mobile'] = $data['user_mobile'];
        $cash_order['user_name'] = $data['user_name'];
        $cash_order['amount'] = $data['amount'];
        $cash_order['trade_type'] = $data['trade_type'];
        $cash_order['remark'] = $data['remark'];
        try{
            app(FinanceCashService::class)->main($cash_order,true);
            $data['status'] = '00';
        }catch(Exception $ex){
            $data['status'] = '30';
            $this->error("记账失败");
        }

        $data->save();
        $this->success("记账成功");

     }

}
