<?php

use think\Env;

return [
    'connector'  => 'Redis',          // Redis 驱动
    'expire'     => 600,             // 任务的过期时间，默认为60秒; 若要禁用，则设置为 null
    'default'    => 'queue_car_mall',
//    'queue'    => 'live_fastadmin_queue',
    'host'       => Env::get('redis.host','127.0.0.1'),
    'port'       => Env::get('redis.port',6937),
    'password'   => Env::get('redis.password','5apGoJ7iIE8ezg9t'),
    'select'     => 11,
    'timeout'    => 0,
    'persistent' => false
];
