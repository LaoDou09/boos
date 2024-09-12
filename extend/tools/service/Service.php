<?php
namespace tools\service;
use app\test\service\UserService;
use Closure;
use think\Db;

class Service {
    public $request;
    public $middleware = [];
    public $container = null;
    public $service = null;
    
    public function __construct($service = null)
    {
        $this->container = Container::getInstance();
        $this->service = $service == null ? $this : $this->container->make($service);
    }
    
    public function handle($request)
    {
        return $request;
    }
    public function set($key, $value)
    {
        if($key){
            $this->request[$key] = $value;
            return $this;
        }
        return $this;
    }
    public function with($key, $value)
    {
        if($key){
            $this->request[$key] = $value;
            return $this;
        }
        return $this;
    }
    
    public function pass($request)
    {
        if(empty($request)) return $this;
        $this->request = $request;
        return $this;
    }
    
    public function run($method = 'handle')
    {
        return $this->runPipeline($method);
    }
    public function runTransaction($method = 'handle')
    {
        $result = null;
        Db::startTrans();
        try {
            $result = $this->runPipeline($method);
            Db::commit();
        }catch (\think\exception\HttpResponseException $e){
            Db::rollback();
            $response = $e->getResponse()->getData();
            err($response['msg'],$response['code'],'',$response['data']);
        }
        return $result;
    } 
    private function runPipeline($method)
    {
        $pipe = new Pipeline($this->container);
        return  $pipe->send($this->request)
            ->through($this->getMiddleware())
            ->then($this->process($this->service, $method));
    }
    
    public function process($class, $method)
    {
        return function ($request) use ($class, $method) {
            $method = get_class($class)."@".$method;
            return BoundMethod::call($this->container,$method,[$request]);
        };
    }
    
    public function middle($middle = null)
    {
        if(!$middle) return $this;
        $this->middleware[] = $middle;
        return $this;
    }
    
    //设置中间件
    public function setMiddleware($middleware=[])
    {
        if(is_array($middleware)){
            $this->middleware = $middleware;
        }
        return $this;
    }
    
    public function getMiddleware()
    {
        return $this->middleware;
    }
}