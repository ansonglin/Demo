//
//  RYActivityTableViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYActivityTableViewCell.h"

@implementation RYActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 活动图片
        self.bigImage = [[UIImageView alloc] init];
        [self addSubview:_bigImage];
        
        self.view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor blackColor];
        _view.alpha = 0.1;
        [_bigImage addSubview:_view];
        // 活动标签
        self.labelTag = [[UILabel alloc] init];
        _labelTag.font = [UIFont systemFontOfSize:20];
        [self addSubview:_labelTag];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bigImage.frame = CGRectMake(10, 10, kScreenW - 20, 135);
    self.view.frame = CGRectMake(0, 98, _bigImage.frame.size.width, 37);
    self.labelTag.frame = CGRectMake(20, 118, _view.frame.size.width - 20, 17);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
