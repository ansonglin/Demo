//
//  RYCollectionViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCollectionViewCell.h"
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 40) / 3
#define ITEMS_HIGHT1 ([UIScreen mainScreen].bounds.size.height - 221) / 4

@implementation RYCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [[UIImageView alloc] initWithFrame:CGRectMake(25, 5, ITEMS_WIDTH1 - 50, ITEMS_WIDTH1 - 50)];
        [self addSubview:_image];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, ITEMS_WIDTH1 - 40, ITEMS_WIDTH1, 15)];
        [_title setTextAlignment:NSTextAlignmentCenter];
        _title.font = [UIFont systemFontOfSize:15];
        [self addSubview:_title];
    }
    return self;
}

@end
