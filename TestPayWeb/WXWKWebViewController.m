//
//  WXWKWebViewController.m
//  TestPayWeb
//
//  Created by MJL on 2018/3/21.
//  Copyright © 2018年 MJL. All rights reserved.
//

#import "WXWKWebViewController.h"
#import <WebKit/WebKit.h>
#import "WebChatPayH5VIew.h"

@interface WXWKWebViewController ()<WKNavigationDelegate>

@property (strong, nonatomic) WKWebView *myWebView;

@end

@implementation WXWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"wkweb微信h5支付";
    self.myWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.myWebView.navigationDelegate = self;
    [self.view addSubview:self.myWebView];
    //加载h5链接
    NSURL *url = [NSURL URLWithString:@""];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.myWebView loadRequest:request];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    NSString *url = navigationAction.request.URL.absoluteString;
    if ([url containsString:@"https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?"]) {
#warning 微信支付链接不要拼接redirect_url，如果拼接了还是会返回到浏览器的
        //传入的是微信支付链接：https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx201801291021026cb304f9050743178155&package=3456576571
        //这里把webView设置成一个像素点，主要是不影响操作和界面，主要的作用是设置referer和调起微信
        WebChatPayH5VIew *h5View = [[WebChatPayH5VIew alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        //url是没有拼接redirect_url微信h5支付链接
        [h5View loadingURL:url withIsWebChatURL:NO];
        [self.view addSubview:h5View];
      decisionHandler(WKNavigationActionPolicyCancel);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
