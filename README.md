# iOS_WXh5
主要是为了解决微信h5支付之后如何返回APP所写的demo,针对于UIWebView和WKWebView

首先你在Xcode中，选择你的工程设置项，选中“TARGETS”一栏，在“info”标签栏的“LSApplicationQueriesSchemes“添加weixin

![](https://upload-images.jianshu.io/upload_images/6525987-416b20a926dc2e11.png?imageMogr2/auto-orient/)

然后设置Referer这个请求头的参数
![](https://upload-images.jianshu.io/upload_images/6525987-00bf617f317d7159.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/700)

然后设置Scheme
![](https://upload-images.jianshu.io/upload_images/6525987-01bc782a93453250.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/691)

所以h5支付最终返回APP的解决方案是：把Referer设置成：www.xxx.com:// scheme设置成：www.xxx.com就可以直接返回APP了。

如果有多个APP运用到h5支付的话，返回的Scheme设置是一个问题，在这里我给大家提供一篇文章，是解决多个APP返回的问题
iOS实现微信外部H5支付完成后返回原APP(多APP也可实现)(http://www.cnblogs.com/Life-Record/p/8472319.html)
