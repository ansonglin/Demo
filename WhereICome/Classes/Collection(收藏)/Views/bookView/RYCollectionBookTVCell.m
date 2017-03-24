
//
//  RYCollectionBookTVCell.m
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCollectionBookTVCell.h"

@implementation RYCollectionBookTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 书籍的图片
        self.ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 17, 111, 62)];
        [self addSubview:_ImageView];
        
        self.labelName = [[UILabel alloc] initWithFrame:CGRectMake(139, 18, kScreenW - 150, 16)];
        [self addSubview:_labelName];
        // 书籍的简介
        self.labelContent = [[UILabel alloc] initWithFrame:CGRectMake(139, 38, kScreenW - 150, 38)];
        [_labelContent setNumberOfLines:0];
        _labelContent.font = [UIFont systemFontOfSize:15];
        _labelContent.textColor = [UIColor grayColor];
//        _labelContent.backgroundColor = [UIColor redColor];
        [self addSubview:_labelContent];
        // 书籍的标签
        self.labelTool = [[RYBookTools alloc] initWithFrame:CGRectMake(15, 89, kScreenW / 2, 12)];
        [self addSubview:_labelTool];
        // 学校的距离标签
        self.labelLoction = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW / 4 * 3, 89, kScreenW / 4 - 20, 12)];
        _labelLoction.textAlignment = NSTextAlignmentRight;
        _labelLoction.font = [UIFont systemFontOfSize:13];
        [self addSubview:_labelLoction];
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
