<?php

use think\Env;

return array (
    'host'       => Env::get('redis.host','127.0.0.1'),
    'port'       => Env::get('redis.port','6379'),
    'password'   => Env::get('redis.password','5apGoJ7iIE8ezg9t'),
    'select'     => Env::get('redis.select',0),
    'timeout'    => Env::get('redis.timeout',0),
    'expire'     => Env::get('redis.expire',0),
    'persistent' => Env::get('redis.persistent',false),
    'prefix'     => Env::get('redis.prefix',''),
);