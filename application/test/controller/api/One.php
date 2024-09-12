<?php

namespace app\test\controller\api;

use app\api\library\Sign;
use app\common\controller\Api;
use tools\jwt\Claims;


class One extends Api {
    protected $noNeedLogin = ['*'];
    
    // http://base_url/test/api/one/test
    public function test(){
        // $ret = config("site.top_up_10");
        // $ret = config('site.cash_status')['begin'];
//        err(lang("TOKEN_EXP"));

        $a = "U1010";
        $b = "U1020";
        $num1 = substr($a,1);
        $num2 = substr($b,1);
        $ret = money()->gt($num1,$num2);
        
        $this->success("ok",$ret);
    }
// http://base_url/test/api/one/test1
    public function test1 (){
        $claims = new Claims();
        $claims->setId("1142889689825594113");
        $claims->setName("13000000001");
        $claims->setRole("出行");
        $token = jwtToken($claims)->getToken();
        $this->success("ok",$token);
    }
    public function test2 (){
        $claims = new Claims();
        $claims->setId("1142889689825594114");
        $claims->setName("13000000002");
        $claims->setRole("出行");
        $token = jwtToken($claims)->getToken();
        $this->success("ok",$token);
    }
    public function test7(){
        $id = ID();
        $small = substr($id,5,15);
        $ret['dig'] = gmp_strval(gmp_init($id,10), 62);
        $ret['small'] = $small;
        $ret['id']= $id;
        $ret['size'] = strlen($ret['dig']);
        $this->ok($ret);
    }
    public function test3(){
        $ret = money()->yuan2Fen(100.2);
        // $ret = money()->yuan2Fen('100');
        // $ret = money()->fen2Yuan(100.21);
        // $ret = money()->fen2Yuan('100');
        $this->ok($ret);
    }
    
    public function test4(){


        $ret = $this->request->post();
        $this->ok($ret);
    }


    public function test5(){
        $date =  date('Y-m-d',strtotime("+1 day"));
        $this->ok($date);
    }
    


    public function test6(){

        $balance=[
            'process_id' =>'1142889689825594114',
            'balance'    => 9999700,
            'open_balance' =>10000000,
            'occurred_amount' =>300,
            'account_type' =>'20',
            'sign' =>'d40b7843069533a5de5a6a317180b512ddb3dfa0'
        ];


        $ret = Sign::makeBalanceSign($balance);
        $this->ok(Sign::checkBalanceSign($balance));

    }

    public function test8(){
        $data =[
            'begin' => date('Y-m-d 00:00:00'),
            'end' => date('Y-m-d 23:59:59')
        ];

        $this->ok($data);
    }
    public function test9(){

        $data =[
            'begin' => date ( "Y-m-d H:i:s", mktime ( 0, 0, 0, date ( "m" ), 1, date ( "Y" ) ) ),
            'end' => date ( "Y-m-d H:i:s", mktime ( 23, 59, 59, date ( "m" ), date ( "t" ), date ( "Y" ) ) )
        ];

        $this->ok($data);     
    }

}