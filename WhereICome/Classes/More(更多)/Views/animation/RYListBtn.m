//
//  RYListBtn.m
//  WhereICome
//
//  Created by 安松林 on 15/5/29.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYListBtn.h"

#define kImageH (kScreenH - 64) * 0.29 / 3 * 2
#define kImageW (kScreenW - 45) / 3

@implementation RYListBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageBtn = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kImageW, kImageH - 10)];
        [self addSubview:_imageBtn];
        
        self.labelBtn = [[UILabel alloc] initWithFrame:CGRectMake(0, kImageH, kImageW, 15)];
        [_labelBtn setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_labelBtn];
    }
    return self;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    self.imageBtn.frame = CGRectMake(0, 0, kImageW, kImageH);
//    
//    self.labelBtn.frame = CGRectMake(0, kImageH + 10, kImageW, 15);
//}

@end
