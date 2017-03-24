
//
//  RYPublicTableViewCell2.m
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPublicTableViewCell2.h"

@implementation RYPublicTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 留言者头像
        self.imageLag = [[UIImageView alloc] init];
        [self addSubview:_imageLag];
        
        // 留言者昵称
        self.labelName = [[UILabel alloc] init];
        [self addSubview:_labelName];
        
        // 留言者时间
        self.labelTime = [[UILabel alloc] init];
        _labelTime.font = [UIFont systemFontOfSize:15];
        _labelTime.textColor = [UIColor colorWithRed:172 / 255.0 green:172 / 255.0 blue:172 / 255.0 alpha:1];
        [self addSubview:_labelTime];
        
        // 留言内容
        self.labelContent = [[UILabel alloc] init];
        _labelContent.font = [UIFont systemFontOfSize:13];
        _labelContent.textColor = [UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:128 / 255.0 alpha:1];
        _labelContent.numberOfLines = 0;
        [self addSubview:_labelContent];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageLag.frame = CGRectMake(10, 10, 40, 40);
    // 根据字符串长度来自适应留言者昵称的宽度
    CGSize sizeName = CGSizeMake(kScreenW / 2, 100);
    CGSize msgSieName = [_labelName.text sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:sizeName];
    self.labelName.frame = CGRectMake(60, 14, msgSieName.width, 15);
    
    // 留言时间
    CGSize sizeTime = CGSizeMake(kScreenW / 2, 100);
    CGSize msgSieTime = [_labelTime.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:sizeTime];
    self.labelTime.frame = CGRectMake(_labelName.frame.size.width + 80, 15, msgSieTime.width, 12);
    
    // 留言内容
    CGSize sizeContent = CGSizeMake(kScreenW / 2, 100);
    CGSize msgSieContent = [_labelContent.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:sizeContent];
    self.labelContent.frame = CGRectMake(60, 35, kScreenW - 80, msgSieContent.height);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
