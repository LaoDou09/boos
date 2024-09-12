1.Controller 用作参数检测和返回结果，不要写具体业务，要调用service或者中间件
2.service中主要用于编写逻辑处理，读写数据库一般用在repo 或者 model中
3 为了方便使用repo和model 可采用注入的方式，在service()管道中间件调用中自动注入，或者使用app()实例化，也会自动注入