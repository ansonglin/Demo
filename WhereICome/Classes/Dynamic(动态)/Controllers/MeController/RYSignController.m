//
//  RYSignController.m
//  WhereICome
//
//  Created by mkq on 15/6/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYSignController.h"
#import "CalendarHomeViewController.h"

@interface RYSignController ()

@property (nonatomic, strong)CalendarHomeViewController *chvc;
@end

@implementation RYSignController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //配置导航栏
    [self configNav];
    
    _chvc = [[CalendarHomeViewController alloc]init];
    [_chvc setAirPlaneToDay:365 ToDateforString:nil];
    [self.view addSubview:_chvc.view];
}

- (void)configNav
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"签到";
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"return_black"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
/**
 *  返回
 */
- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
