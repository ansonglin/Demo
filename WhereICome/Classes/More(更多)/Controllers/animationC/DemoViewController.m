//
//  DemoViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation DemoViewController

- (void)dealloc
{
    _timer = nil;
}

#pragma mark 做一个假数据先放着
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    //设置显示样式,见UIActivityIndicatorViewStyle的定义
    _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    //设置显示位置
    [_indicator setCenter:CGPointMake(kScreenW / 2 - 50, kScreenH / 3)];
    _indicator.backgroundColor = [UIColor blackColor];
    //设置背景透明
    //设置背景为圆角矩形
    _indicator.layer.cornerRadius = 6;
    _indicator.layer.masksToBounds = YES;
//    [self.view bringSubviewToFront:_indicator];
    //将初始化好的indicator add到view中
    [self.view addSubview:_indicator];
    //开始显示Loading动画
    [_indicator startAnimating];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:8.0f target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    [_timer setFireDate:[NSDate distantPast]];
    
    self.navigationController.navigationBar.translucent = NO;
}

- (void)timerAction
{
    [self createWebview];

}

- (void)createWebview
{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    _webView.delegate = self;
    NSURL *url = [NSURL URLWithString:_urlName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    [_indicator stopAnimating];
    [_webView setScalesPageToFit:YES];
    [self.view addSubview:_webView];
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
