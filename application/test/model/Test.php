<?php
namespace app\test\model;

use think\Model;

class Test extends Model{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $append = [
    ];
    
    
}