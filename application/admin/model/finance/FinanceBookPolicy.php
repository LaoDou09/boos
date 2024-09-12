<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceBookPolicy extends Model
{

    

    

    // 表名
    protected $table = 'fin_book_policy';
    
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
    

    
    public function getStatusList()
    {
        return ['00' => '启用','99'=>'禁用'];
    }


    public function getStatusTextAttr($value, $data)
    {
        $value = $value ? $value : (isset($data['status']) ? $data['status'] : '');
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    protected static function init()
    {
        self::event('before_insert', function ($data) {
            $data->id = ID();
        });
    }
    


}
