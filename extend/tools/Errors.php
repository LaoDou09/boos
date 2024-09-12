<?php

namespace tools;

use think\Request;
use think\Response;
use think\Url;
use think\exception\HttpResponseException;
use think\View as ViewTemplate;

class Errors{
    
    public static function handle($msg = '', $code = '9999', $url = null, $data = '', $wait = 3, array $header = []){
        if (is_null($url)) {
            $url = Request::instance()->isAjax() ? '' : 'javascript:history.back(-1);';
        } elseif ('' !== $url && !strpos($url, '://') && 0 !== strpos($url, '/')) {
            $url = Url::build($url);
        }
        $type = config('default_ajax_return');
        $result = [
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
            'url' => $url,
            'wait' => $wait,
        ];

        if ('html' == strtolower($type)) {
            $template = config('template');
            $view = config('view_replace_str');

            $result = ViewTemplate::instance($template, $view)
                ->fetch(config('dispatch_error_tmpl'), $result);
        }

        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }
    
}
