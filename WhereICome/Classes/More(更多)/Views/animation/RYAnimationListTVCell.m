//
//  RYAnimationListTVCell.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAnimationListTVCell.h"

@implementation RYAnimationListTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *bigImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"animation_bigImage"]];
        bigImage.layer.shadowOffset =  CGSizeMake(0.5,0.5);
        bigImage.layer.shadowOpacity = 1;
        bigImage.frame = CGRectMake(0, 2, kScreenW, kScreenH * 0.29);
//        [self.contentView addSubview:bigImage];
        
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_button];
        
        [self createButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    
    self.titleLabel.frame = CGRectMake(10, 10, kScreenW / 4, 20);
    self.button.frame = CGRectMake(kScreenW - 70, 12, 60, 10);
    _button.titleLabel.textAlignment = NSTextAlignmentRight;
}

- (void)createButton
{
    self.buttonOne = [[RYListBtn alloc] initWithFrame:CGRectMake(10, 40, (kScreenW - 45) / 3, kScreenH * 0.29 - 40)];
    _buttonOne.tag = 1000;
    [self.contentView addSubview:_buttonOne];
    
    self.buttonTwo = [[RYListBtn alloc] initWithFrame:CGRectMake(10 + 12.5 + (kScreenW - 45) / 3, 40, (kScreenW - 45) / 3, kScreenH * 0.29 - 40)];
    _buttonTwo.tag = 1001;
    [self.contentView addSubview:_buttonTwo];
    
    self.buttonThree = [[RYListBtn alloc] initWithFrame:CGRectMake(10 + (kScreenW - 45) / 3 * 2 + 25, 40, (kScreenW - 45) / 3, kScreenH * 0.29 - 40)];
    _buttonThree.tag = 1002;
    [self.contentView addSubview:_buttonThree];
    
}

#pragma mark 重写drawRect方法来自定义分割线
//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//    //上分割线，
//    // CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor); CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
//    //下分割线
//    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor); CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 1));
//}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
