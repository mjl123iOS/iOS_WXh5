//
//  ViewController.m
//  TestPayWeb
//
//  Created by MJL on 2018/1/9.
//  Copyright © 2018年 MJL. All rights reserved.
//

#import "ViewController.h"
#import "WXWebViewController.h"
#import "WXWKWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self webButton];
    [self wkWebButton];
}

- (void)webButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 100, 200, 45);
    [btn setTitle:@"webView微信h5支付请求" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(webButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)wkWebButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 200, 200, 45);
    [btn setTitle:@"WKwebView微信h5支付请求" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(WKWebButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark -webView微信h5支付请求
- (void)webButtonAction {
    WXWebViewController *webVC = [[WXWebViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:YES];
}

#pragma mark -WKwebView微信h5支付请求
- (void)WKWebButtonAction {
    WXWKWebViewController *wkVC = [[WXWKWebViewController alloc] init];
    [self.navigationController pushViewController:wkVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
