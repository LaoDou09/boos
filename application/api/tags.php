<?php

use app\api\hook\finance\FinanceAccountHook;
use app\api\hook\UserIncomeHook;

return [
    'user_info_ok' => [
        FinanceAccountHook::class
    ],

    'book_order_success' => [
        UserIncomeHook::class
    ],
];