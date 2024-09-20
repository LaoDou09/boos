---
title: car_mall
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - ruby: Ruby
  - python: Python
  - php: PHP
  - java: Java
  - go: Go
toc_footers: []
includes: []
search: true
code_clipboard: true
highlight_theme: darkula
headingLevel: 2
generator: "@tarslib/widdershins v4.0.23"

---

# car_mall

Base URLs:

# Authentication

# Default

## POST /api/user/login

POST /api/user/login

> Body 请求参数

```yaml
account: ""
password: ""

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» account|body|string| 否 |none|
|» password|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/user/thirdTokenLogin

POST /api/user/thirdTokenLogin

> Body 请求参数

```yaml
third_token: "{{thirdToken}}"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|body|body|object| 否 |none|
|» third_token|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## GET /test/api/one/test1

GET /test/api/one/test2

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## GET /test/api/six/test

GET /test/api/six/test

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/finance/finance_balance/getUserBalance

POST /api/finance/finance_balance/getUserBalance

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/userinfo/user_level/getLevelList

POST /api/userinfo/user_level/getLevelList

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/userinfo/user_level/getLevelById

POST /api/userinfo/user_level/getLevelById

> Body 请求参数

```yaml
id: "1941873958420022528"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|
|body|body|object| 否 |none|
|» id|body|string| 否 |分组|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/userinfo/user_level/buyLevel

POST /api/userinfo/user_level/buyLevel

> Body 请求参数

```yaml
user_level_id: "123123"
promotion_code: "123123123123"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|
|body|body|object| 否 |none|
|» user_level_id|body|string| 是 |none|
|» promotion_code|body|string| 是 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/finance/finance_book_order/getBookOrder

POST /api/finance/finance_book_order/getBookOrder

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/finance/finance_cash_order/getCashOrder

POST /api/finance/finance_cash_order/getCashOrder

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/finance/finance_cash_order/getToUserOrder

POST /api/finance/finance_cash_order/getToUserOrder

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/finance/finance_transfer/trans20ToUser

POST /api/finance/finance_transfer/trans20ToUser

> Body 请求参数

```yaml
mobile: "15565184403"
amount: "10000"

```

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|
|body|body|object| 否 |none|
|» mobile|body|string| 否 |none|
|» amount|body|string| 否 |none|

> 返回示例

> 200 Response

```json
{}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

## POST /api/report/user_report/getUserKpi

POST /api/report/user_report/getUserKpi

### 请求参数

|名称|位置|类型|必选|说明|
|---|---|---|---|---|
|token|cookie|string| 否 |none|

> 返回示例

> 200 Response

```json
{
    "code": 1,
    "msg": "ok",
    "time": "1726735557",
    "data": {
        "u1010": 0,
        "u1020": 0,
        "u1030": 2,
        "kpi_today": 0,
        "kpi_month": 355300000,
        "kpi_all": 355300000
    }
}
```

### 返回结果

|状态码|状态码含义|说明|数据模型|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|none|Inline|

### 返回数据结构

# 数据模型

