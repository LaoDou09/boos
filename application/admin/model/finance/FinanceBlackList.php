<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceBlackList extends Model
{

    

    

    // 表名
    protected $table = 'fin_black_list';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

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
