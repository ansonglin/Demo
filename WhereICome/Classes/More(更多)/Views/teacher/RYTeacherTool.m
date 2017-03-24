
//
//  RYTeacherTool.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTeacherTool.h"

@implementation RYTeacherTool

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 9, 12)];
        image.image = [UIImage imageNamed:@"teacher_label"];
        [self addSubview:image];
        // 老师标签
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenW / 2, 12)];
        _label.font = [UIFont systemFontOfSize:12];
        _label.textColor = [UIColor blueColor];
        [self addSubview:_label];
    }
    return self;
}

@end
