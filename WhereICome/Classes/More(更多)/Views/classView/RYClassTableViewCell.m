//
//  RYClassTableViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYClassTableViewCell.h"

@implementation RYClassTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 课堂的图片
        self.imageA = [[UIImageView alloc] initWithFrame:CGRectMake(14, 17, 110, 75)];
        [self addSubview:_imageA];
        
        // 课堂的名
        self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(140, 17, kScreenW - 170, 20)];
        _labelName.font = [UIFont systemFontOfSize:18];
        [self addSubview:_labelName];
        
        // 课堂老师
        self.labelTea = [[UILabel alloc] initWithFrame:CGRectMake(140, 50, kScreenW - 170, 16)];
        [self addSubview:_labelTea];
        
        // 课堂标签
        self.labelTools = [[RYBookTools alloc] initWithFrame:CGRectMake(140, 80, kScreenW - 160, 12)];
        [self addSubview:_labelTools];

    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
