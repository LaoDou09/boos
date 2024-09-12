<?php
namespace tools\service;

use Closure;

interface  Middleware{
   public function handle($request,Closure $next);
}