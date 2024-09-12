<?php

return [
    //名称要与Hook::Listen的对应
     'test_hook' =>   [
        \app\test\hook\TestHookOne::class,
        \app\test\hook\TestHookTwo::class
        
    ]
];