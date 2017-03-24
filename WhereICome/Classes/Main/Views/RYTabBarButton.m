//
//  RYTabBarButton.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define RYTabBarButtonImageRadio 0.6

#warning tabBar 字体颜色更改处
//按钮的默认文字颜色
#define RYTabBarButtonTitleColor [UIColor blackColor]
//按钮选中的颜色
#define RYTabBarButtonTitleSelectedColor  RYColor(118,149,189)

// 图标的比例
#define RYTabBarButtonImageRatio 0.6

#import "RYTabBarButton.h"
#import "RYBadgeButton.h"

@interface RYTabBarButton ()
/**
 *  通知提示按钮
 */
@property (nonatomic, strong)RYBadgeButton *badgeBttton;

@end

@implementation RYTabBarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //图片居中显示
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中显示
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [self setTitleColor:RYTabBarButtonTitleColor forState:(UIControlStateNormal)];
        [self setTitleColor:RYTabBarButtonTitleSelectedColor forState:(UIControlStateSelected)];
        
        //添加提醒按钮
        _badgeBttton = [[RYBadgeButton alloc] init];
        //设置这个button的父视图变化时,它的右边和上边保持不变 左边下边变化
        _badgeBttton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
        [self addSubview:_badgeBttton];
    }
    return self;
}

// 内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * RYTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

// 内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * RYTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    //添加监听事件
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    //设置数字提醒
    self.badgeBttton.badgeValue = self.item.badgeValue;
    //修改badgeBtn的相对位置
    CGRect frame = self.badgeBttton.frame;
    frame.origin.x = self.frame.size.width - self.badgeBttton.frame.size.width-2;
    frame.origin.y = 2;
    self.badgeBttton.frame = frame;
}

/**
 *  不显示高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted{};

@end
