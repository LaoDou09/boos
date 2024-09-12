<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceBookTemplate extends Model
{

    

    

    // 表名
    protected $table = 'fin_book_template';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'datetime';
    protected $dateFormat = 'Y-m-d H:i:s';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';

    // 追加属性
    protected $append = [

    ];
    
    protected static function init()
    {
        self::event('before_insert', function ($data) {
            $data->id = ID();
        });
    }
    
    







}
