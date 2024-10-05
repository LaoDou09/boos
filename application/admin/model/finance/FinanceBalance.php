<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceBalance extends Model
{

    static $options =[
        'account_type' =>[
            '10' =>'余额',
            '20' =>'绿色积分',
            '30' =>'碳积分:分红权',
            '90' =>'冻结如e卷',
            '91' =>'如e卷'
        ],
        'account_object' =>[
            '10' =>'商户',
            '20' =>'代理',
            '30' =>'通道',
            '40' =>'私有',
            '70' =>'合伙人',
            '80' =>'用户'
        ],
        'direction' =>[
            '0' => '未使用',
            '10' =>'收入',
            '20' =>'支出'
        ],
    ];

    

    // 表名
    protected $table = 'fin_balance';
    
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
