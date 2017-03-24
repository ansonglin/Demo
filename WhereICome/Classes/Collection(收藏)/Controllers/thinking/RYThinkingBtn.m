//
//  RYThinkingBtn.m
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYThinkingBtn.h"

#define KSImageScale 0.8


@implementation RYThinkingBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

+ (RYThinkingBtn *)createBtnWithType:(UIButtonType)buttontype
{
    RYThinkingBtn *button = [RYThinkingBtn buttonWithType:buttontype];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.layer.cornerRadius = 30;
    button.layer.masksToBounds = YES;
    // 水平显示位置
    [button setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    // 垂直显示位置
    [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    return button;
}

/*
 *可以通过子类化按钮来定制属于你自己的按钮类。
 在子类化的时候你可以重载下面这些方法，这些方法返回CGRect结构，指明了按钮每一组成部分的边界。
 注意：不要直接调用这些方法， 这些方法是你写给系统调用的。
 */

//返回背景边界 (image + title)
- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    return bounds;
}
// 返回其中接收机绘制其整个内容的矩形。
- (CGRect)contentRectForBounds:(CGRect)bounds
{
    return bounds;
}

//返回image边界
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat W = contentRect.size.width - 60;
    CGFloat H = (contentRect.size.height - 60) * KSImageScale;
    return CGRectMake(30, 30, W, H);
}

//返回title边界
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat Y = contentRect.size.height * KSImageScale;
    CGFloat W = contentRect.size.width;
    CGFloat H = contentRect.size.height * (1 - KSImageScale);
    return CGRectMake(0, Y, W, H);
}



@end
