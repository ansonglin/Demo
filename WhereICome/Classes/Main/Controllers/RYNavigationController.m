//
//  RYNavigationController.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYNavigationController.h"

@interface RYNavigationController ()

@end

@implementation RYNavigationController


+ (void)initialize
{
    //设置导航栏主题
    [self setupNavBarTheme];
    //设置导航栏按钮主题
    [self setupBarButtonItemTheme];
}

+ (void)setupNavBarTheme{
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置标题的属性
    NSMutableDictionary *textAtts = [NSMutableDictionary dictionary];
    textAtts[UITextAttributeTextColor] = [UIColor blackColor];
    textAtts[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    textAtts[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    
    [navBar setTitleTextAttributes:textAtts];
    
    //设置背景颜色
#pragma  设置导航栏的背景颜色
//    [navBar setBarTintColor:[UIColor orangeColor]];
}

+ (void)setupBarButtonItemTheme{
    
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:14];
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    [item setTitleTextAttributes:textAttrs forState:(UIControlStateNormal)];
    [item setTitleTextAttributes:textAttrs forState:(UIControlStateSelected)];
}

/**
 *  拦截导航控制器的push操作
 *
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark 控制状态栏的样式 默认是黑色的
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


@end
