

//
//  RYPsychologyCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPsychologyCell.h"
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 42) / 3

@implementation RYPsychologyCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 专家图片
        self.Image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ITEMS_WIDTH1, ITEMS_WIDTH1)];
        [self addSubview:_Image];
        // 专家名字
        self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(0, ITEMS_WIDTH1 + 5, ITEMS_WIDTH1, 20)];
        _labelName.textAlignment = NSTextAlignmentCenter;
        _labelName.font = [UIFont systemFontOfSize:16.0f];
        _labelName.adjustsFontSizeToFitWidth = YES;
        [self addSubview:_labelName];
    }
    return self;
}


@end
