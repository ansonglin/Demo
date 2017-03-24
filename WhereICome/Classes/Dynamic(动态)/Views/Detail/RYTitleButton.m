//
//  RYTitleButton.m
//  WhereICome
//
//  Created by mkq on 15/6/2.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define IWTitleButtonImageW 20
#define IWTitleButtonImageH 20

#import "RYTitleButton.h"

@implementation RYTitleButton

+ (instancetype)titleButton
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.imageView.contentMode = UIViewContentModeCenter;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 背景
//        [self setBackgroundImage:[UIImage resizedImageWithName:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
//        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = -10;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageX = 0;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = IWTitleButtonImageH;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - IWTitleButtonImageH;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
