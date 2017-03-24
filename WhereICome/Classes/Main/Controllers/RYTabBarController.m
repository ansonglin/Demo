//
//  RYTabBarController.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabBarController.h"
#import "RYTabBar.h"
#import "RYNavigationController.h"

#import "RYConnectionViewController.h"
#import "RYCollectionViewController.h"
#import "RYMoreViewController.h"

#import "RYDynamicController.h"

@interface RYTabBarController ()<RYTabBarDelegate>
/**
 *  自定义的TabBar
 */
@property (nonatomic, strong)RYTabBar *customTabBar;

@end

@implementation RYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化自定义的 TabBar
    [self setupTabBar];
    //初始化子控制器
    [self setupAllChildViewController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //将以前添加的 UITabBarButton从父容器删除
    for (UIView *childView in self.tabBar.subviews) {
        //UITabBarButton 由于是 API 的私有类 所以不能直接使用
        //        NSLog(@"%@",[childView superclass]);UITabBarButton的父类是 UIControl
        if ([childView isKindOfClass:[UIControl class]]) {
            [childView removeFromSuperview];
        }
    }
}

- (void)setupTabBar
{
    _customTabBar = [[RYTabBar alloc] init];
    
    _customTabBar.frame = self.tabBar.bounds;
    _customTabBar.delegate = self;
    
//    _customTabBar.backgroundColor = [UIColor orangeColor];
    //添加到
    [self.tabBar addSubview:_customTabBar];
}

- (void)setupAllChildViewController
{
    //动态
    RYDynamicController *home = [[RYDynamicController alloc] init];
    
    [self setupChildViewController:home title:@"动态" image:@"menu_dynamic" selectImage:@"menu_dynamic_se"];
    //人脉
    RYConnectionViewController *message = [[RYConnectionViewController alloc] init];
    
    [self setupChildViewController:message title:@"人脉" image:@"menu_contacts" selectImage:@"menu_contacts_se"];
    
    //收藏
    RYCollectionViewController *discover = [[RYCollectionViewController alloc] init];
    
    [self setupChildViewController:discover title:@"收藏" image:@"menu_collection" selectImage:@"menu_collection_se"];
    
    //更多
    RYMoreViewController *me = [[RYMoreViewController alloc] init];
//    me.tabBarItem.badgeValue = @"5";
    [self setupChildViewController:me title:@"更多" image:@"menu_more" selectImage:@"menu_more_se"];
}

- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    //属性设置
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    //imageWithRenderingMode 使 选中的图片保持原来的颜色,不要渲染 不设置的话,是系统给的渲染颜色蓝色
    UIImage *selectImg = [UIImage imageNamed:selectImage];
    
    childVc.tabBarItem.selectedImage = [selectImg imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];

    //包装一个导航控制器
    RYNavigationController *nav = [[RYNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
    //向自定义的 TabBar 添加相对数量的 Button
    //将childVc.tabBarItem 用作模型数据
    [self.customTabBar addButton:childVc.tabBarItem];
}

#pragma mark RYTabBarDelegate

- (void)tabBar:(RYTabBar *)tabBar didSelectFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}
@end
