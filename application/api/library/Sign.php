<?php

namespace app\api\library;

class Sign {
    public static  $key = 'Z5H6IJV2EDXZ7IZKAHADP1XQBZA11ROZ';

    public static function checkBalanceSign($balance){

        //初始化用户return true
        if(!$balance['sign']
            && $balance['balance'] == 0  
            && $balance['open_balance']== 0  
            && $balance['occurred_amount']== 0){
            return true;
        }
        return $balance['sign'] == Sign::makeBalanceSign($balance);
    }


    public static function makeBalanceSign($balance){
        $plainText = $balance['process_id'].
            $balance['balance'].
            $balance['open_balance'].
            $balance['occurred_amount'].
            $balance['account_type'].
            Sign::$key;
        return sha1($plainText);
    }

    public static function makeCashSign($cash_order){
        $plainText = $cash_order['user_id'].
            $cash_order['book_code'].
            $cash_order['amount'].
            $cash_order['trade_type'].
            Sign::$key;
        return sha1($plainText);
    }

    public static function checkCashSign($cash_order){
        return $cash_order['sign'] = Sign::makeCashSign($cash_order);
    }

    public static function makeBookSign($book_order){
        $plainText = $book_order['process_id'].
                $book_order['batch_id'].
                $book_order['book_code'].
                $book_order['debit_amount'].
                $book_order['credit_amount'].
                $book_order['direction'].
                Sign::$key;
        return sha1($plainText);
    }
    public static function checkBookSign($book_order){
        return $book_order['sign'] == Sign::makeBookSign(($book_order));
    }
}