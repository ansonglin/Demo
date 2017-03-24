//
//  RYToolBarBtn.m
//  WhereICome
//
//  Created by mkq on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYToolBarBtn.h"

#define kTextColor    RYColorFromRGB(0Xbbbbbb)

@implementation RYToolBarBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self setTitleColor:RYColor(173, 173, 173) forState:(UIControlStateNormal)];
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 0);
        //设置文字颜色
        [self setTitleColor:kTextColor forState:(UIControlStateNormal)];
        [self setTitleColor:kTextColor forState:(UIControlStateHighlighted)];
//        self.titleLabel.font = [UIFont systemFontOfSize:12];
    }
    
    return self;
}
@end
