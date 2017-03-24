//
//  RYBookTools.m
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYBookTools.h"

@implementation RYBookTools

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.labelTitle = [[UILabel alloc] init];
        _labelTitle.font = [UIFont systemFontOfSize:13];
        _labelTitle.textColor = [UIColor blueColor];
        [self addSubview:_labelTitle];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    UIImage  *image = [UIImage imageNamed:@"collection_book_label"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 8.5, 12);
    [self addSubview:imageView];
    
    self.labelTitle.frame = CGRectMake(14, 0, kScreenW / 2, 12);
    
}

@end
