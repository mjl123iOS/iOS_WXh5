//
//  WXWebViewController.m
//  TestPayWeb
//
//  Created by MJL on 2018/3/21.
//  Copyright © 2018年 MJL. All rights reserved.
//

#import "WXWebViewController.h"
#import "WebChatPayH5VIew.h"

@interface WXWebViewController ()<UIWebViewDelegate>

@property (strong, nonatomic) UIWebView *myWebView;

@end

@implementation WXWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"web微信h5支付";
    self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.myWebView];
    self.myWebView.delegate = self;
    //加载h5链接
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"xxxxxx"]]];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = [request URL];
    NSString *newUrl = url.absoluteString;
#warning 微信支付链接不要拼接redirect_url，如果拼接了还是会返回到浏览器的
    //传入的是微信支付链接：https://wx.tenpay.com/cgi-bin/mmpayweb-bin/checkmweb?prepay_id=wx201801291021026cb304f9050743178155&package=3456576571
    if ([newUrl rangeOfString:@"https://wx.tenpay.com"].location != NSNotFound) {
        //这里把webView设置成一个像素点，主要是不影响操作和界面，主要的作用是设置referer和调起微信
        WebChatPayH5VIew *h5View = [[WebChatPayH5VIew alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
        //newUrl是没有拼接redirect_url微信h5支付链接
        [h5View loadingURL:newUrl withIsWebChatURL:NO];
        [self.view addSubview:h5View];
        
        return NO;
    }
    return YES;
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
