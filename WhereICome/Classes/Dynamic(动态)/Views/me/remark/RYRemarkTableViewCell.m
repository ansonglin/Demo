//
//  RYRemarkTableViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/7/7.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYRemarkTableViewCell.h"

@implementation RYRemarkTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.labelRemark = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, kScreenW - 20, 20)];
        
        [self addSubview:_labelRemark];
        
        self.labelDate = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, kScreenW - 20, 15)];
        _labelDate.font = [UIFont systemFontOfSize:15.0f];
        _labelDate.textColor = [UIColor grayColor];
        [self addSubview:_labelDate];
    }
    return self;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
