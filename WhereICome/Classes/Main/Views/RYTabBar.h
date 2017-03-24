//
//  RYTabBar.h
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RYTabBar;
/**
 *  代理协议 通知RYTabBarController 模块之间的切换
 */
@protocol RYTabBarDelegate<NSObject>

- (void)tabBar:(RYTabBar *)tabBar didSelectFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface RYTabBar : UIView
/**
 *  代理对象
 */
@property (nonatomic, weak)id<RYTabBarDelegate> delegate;

/**
 *  添加一个按钮
 */
- (void)addButton:(UITabBarItem *)tabBar;


@end
