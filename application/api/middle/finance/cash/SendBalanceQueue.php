<?php

namespace app\api\middle\finance\cash;

use app\api\job\finance\UpdateBalanceJob;
use Closure;
use think\Queue;
use tools\service\Middleware;

class SendBalanceQueue implements Middleware {

    public function handle($request, Closure $next)
    {
        $data = $request['book_orders'];
        Queue::push(UpdateBalanceJob::class,$data);
        return $next($request);
    }
}