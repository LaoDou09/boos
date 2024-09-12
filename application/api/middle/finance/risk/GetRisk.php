<?php
namespace app\api\middle\finance\risk;

trait GetRisk {
    function getRiskTemplate($risks,$name){
        foreach($risks as $value){
            if($value['risk_bean'] == $name){
                return $value;
            }
        }
    }
}