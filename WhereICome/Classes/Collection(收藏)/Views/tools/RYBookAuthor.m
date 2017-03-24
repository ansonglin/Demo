


//
//  RYBookAuthor.m
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYBookAuthor.h"

@implementation RYBookAuthor

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelAuthor = [[UILabel alloc] init];
        _labelAuthor.font = [UIFont systemFontOfSize:13];
        [self addSubview:_labelAuthor];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"作者:";
    label.font = [UIFont systemFontOfSize:13];
    label.frame = CGRectMake(0, 0, 34, 12);
    [self addSubview:label];
    
    self.labelAuthor.frame = CGRectMake(34, 0, kScreenW / 3, 12);
}

@end
