
//
//  DateTableViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "DateTableViewCell.h"

@implementation DateTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 分组图像
        self.imageA = [[UIImageView alloc] init];
        [self addSubview:_imageA];
        // 分组名
        self.labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        // 分组人数
        self.labelNumber = [[UILabel alloc] init];
         _labelNumber.font = [UIFont systemFontOfSize:16.0f];
        _labelNumber.textAlignment = NSTextAlignmentRight;
        [self addSubview:_labelNumber];
        // 分组人标签
        self.labelContent = [[UILabel alloc] init];
        _labelContent.textColor = [UIColor grayColor];
        _labelContent.font = [UIFont systemFontOfSize:13.0f];
        [self addSubview:_labelContent];
    }
    return self;
}

- (void)setupWithTitle:(NSString *)title contentText:(NSString *)contentText numberTest:(NSString *)numberTest level:(NSInteger)level imageI:(NSString *)image
{
    self.labelTitle.text = title;
#pragma mark -
#pragma mark 改变每个cell的名称的frame
    if (level == 2) {
        _labelTitle.frame = CGRectMake(70, 10, kScreenW / 2, 16);
        _labelContent.frame = CGRectMake(70, 33, kScreenW - 80, 12);
        self.imageA.frame = CGRectMake(20, 5, 40, 40);
        _imageA.image = [UIImage imageNamed:image];
        self.labelNumber.text = nil;
        _labelTitle.font = [UIFont systemFontOfSize:15.0f];

        _labelContent.text = contentText;
    } else if (level == 0) {
        self.imageA.frame = CGRectMake(15, 11.5, 12, 12);
        _labelTitle.frame = CGRectMake(30, 10, kScreenW / 2, 15);
        _labelTitle.font = [UIFont systemFontOfSize:17.0f];
        self.labelNumber.text = nil;
        _labelContent.text = nil;
    } else {
        self.imageA.frame = CGRectMake(30, 11.5, 12, 12);
        _labelTitle.frame = CGRectMake(45, 10, kScreenW / 2, 15);
        _labelNumber.frame = CGRectMake(kScreenW - 70, 10, 60, 15);
        _labelTitle.font = [UIFont systemFontOfSize:16.0f];

        self.labelNumber.text = numberTest;
        _labelContent.text = nil;
    }
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
