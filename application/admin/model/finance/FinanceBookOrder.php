<?php

namespace app\admin\model\finance;

use think\Model;


class FinanceBookOrder extends Model
{

    static $options = [
        'book_category' =>[
            '1' => '资产',
            '2' =>'负债',
            '3' =>'所有者权益',
            '4' => '其它收入',
            '5' =>'主营成本',
            '6' =>'主营收入',
        ],
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
            '10' =>'借',
            '20' =>'贷'
        ],
        'status' =>[
            '10' =>'未记账',
            '00' =>'已记账'
        ]
    ];

    

    // 表名
    protected $table = 'fin_book_order';
    
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
        return ['10' =>'未记账','00'=>'已记账'];
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
