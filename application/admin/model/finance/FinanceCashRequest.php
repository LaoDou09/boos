<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceCashRequest extends Model
{


    // 表名
    protected $table = 'fin_cash_request';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    protected $dateFormat = 'Y-m-d H:i:s';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    // 追加属性
    protected $append = [
        'status_text'
    ];
    
    protected static function init()
    {
        self::event('before_insert', function ($data) {
            $data->id = ID();
        });
    }
    
    
    public function getStatusList()
    {
        return [
            '10' => '草稿',
            '20' => '审批中',
            '30' => '审批完成',
            '40' => '收银请求中',
            '00' => '收银成功',
            '99' => '收银失败'
        ];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
