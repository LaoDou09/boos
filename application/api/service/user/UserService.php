<?php

namespace app\api\service\user;

use app\admin\model\User;
use app\admin\model\user\UserInfo;
use app\common\library\Auth;
use think\Db;
use think\Exception;
use think\Hook;
use think\Log;
use tools\jwt\Claims;

class UserService {

    public $mUser;
    public $mUserInfo;
    public $auth;

    public function __construct(User $user,UserInfo $userInfo) {
        $this->mUser = $user;
        $this->mUserInfo = $userInfo;
        $this->auth = Auth::instance();
    }
    public function thirdTokenLogin($token){
        Log::info('third_token_login::',$token);
        //下面是lumen下token的设置方法
        // id 为用户id,login_name为手机号
        // $token=Token()
        // ->setId($ret['id'])
        // ->setName($ret['login_name'])
        // ->setRole($ret['user_tariff_code'])
        // ->getToken();
        //根据user_id 查询user_info ,有则直接登录
        //如果没有,则走注册流程,生成用户user和user_info信息
        $claims = JwtToken()->verifyToken($token);
        $userInfo = $this->mUserInfo->where('user_id',$claims->getId())->find();
        // $lastSql = $this->mUserInfo->getLastSql();
        // Log::info($lastSql);
        if($userInfo){
            $this->auth->direct($userInfo->id);
            $user=$this->auth->getUserinfo();
            $user['user_info'] = $userInfo;
            return $user;
        }else{
            return $this->createUserLogin($claims,$token);
        }
    }

    private function createUserLogin(Claims $claims,$token){
        $username = $claims->getName();
        $passwd = substr($username,-1,6);
        $ret = $this->auth->register($username,$passwd,'',$username);
        if($ret){
            $user=$this->auth->getUserinfo();

            $data=[
                'id' =>$user['id'],
                'user_id' =>$claims->getId(),
                'user_name' =>$claims->getName(),
                'login_name' =>$claims->getName(),
                'user_level' =>'U1000',
                'agent_level' =>'A1000',
                'sys_level' =>'S1000',
                'cash_status' =>'00',
                'token' => $token,
                'cash_code' =>$claims->getId(),
                'promotion_code' =>$this->getPromotionCode(),
            ];
            Db::startTrans();
            try{
                $this->mUserInfo->isUpdate(false)->save($data);
                $user['user_info'] = $data;
                Log::info('user_info_ok::'.json_encode($data));
                Hook::listen('user_info_ok',$data);
                Log::info('user_info_ok::hook start');
                Db::commit();
                return $user;
            }catch(Exception $e){
                Db::rollback();
                err($e->getMessage());
            };
        }
        err("用户注册失败");
    }
    private function getPromotionCode(){
        $code = getRandStr(8);
        $ret = $this->mUserInfo->where('promotion_code',$code)->find();
        if($ret){
            return $this->getPromotionCode();
        }else{
            return $code;
        } 
    }

}