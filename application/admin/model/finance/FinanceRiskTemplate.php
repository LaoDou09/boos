<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceRiskTemplate extends Model
{

    

    

    // 表名
    protected $table = 'fin_risk_template';
    

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
            '00' =>'启用',
            '99' =>'禁用'
        ];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




}
