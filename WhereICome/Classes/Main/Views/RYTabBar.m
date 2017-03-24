//
//  RYTabBar.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabBar.h"
#import "RYTabBarButton.h"
@interface RYTabBar ()
/**
 *  用来记录选中的按钮
 */
@property (nonatomic, weak)RYTabBarButton *selectButton;

@property (nonatomic, strong)NSMutableArray *barButtons;

@end

@implementation RYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
#warning 此处使用背景色 或者 颜色值 待定
//        self.backgroundColor = [UIColor redColor];
        
    }
    
    return self;
}

/**
 *  添加一个按钮
 */
- (void)addButton:(UITabBarItem *)tabBar
{
    //创建btn
    RYTabBarButton *btn = [[RYTabBarButton alloc] init];
    [self addSubview:btn];
    [self.barButtons addObject:btn];
    //属性设置
    btn.item = tabBar;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    //默认选中第一个模块
    if (self.barButtons.count == 1) {
        [self btnClick:btn];
    }

}
/**
 *  按钮点击事件处理
 */
- (void)btnClick:(RYTabBarButton *)sender
{
    if (self.delegate != nil &&
        [self.delegate respondsToSelector:@selector(tabBar:didSelectFrom:to:)]) {
        
        [self.delegate tabBar:self didSelectFrom:self.selectButton.tag to:sender.tag];
        
    }
    //修改选中的按钮
    self.selectButton.selected = NO;
    sender.selected = YES;
    self.selectButton = sender;
    
}

- (void)layoutSubviews
{
    //
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    CGFloat btnY = 0;//相对应于 UITabBarViewController 内
    CGFloat btnW = w / self.barButtons.count;
    CGFloat btnH = h;
    //    NSLog(@"%@",self.barbuttons);
    
    for (int i=0; i<self.barButtons.count; i++) {
        RYTabBarButton *btn = self.barButtons[i];
        CGFloat btnX = i*btnW;
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        btn.tag = i;
    }
}

/**
 *  懒加载 处理
 */
- (NSMutableArray *)barButtons
{
    if (_barButtons == nil) {
        _barButtons = [NSMutableArray array];
    }
    return _barButtons;
}
@end
