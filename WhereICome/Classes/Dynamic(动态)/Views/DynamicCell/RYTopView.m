//
//  RYTopView.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
#define kContentColor   RYColorFromRGB(0X000000)
#define kAdressColor RYColorFromRGB(0X737373)

#import "RYTopView.h"
#import "RYToolBarBtn.h"
@interface RYTopView ()

@end

@implementation RYTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor orangeColor];
        //创建用户头像
        NSInteger iconX = 12;
        NSInteger iconY = 16;
        CGRect iconRect = CGRectMake(iconX, iconY, kUserIconW, kUserIconH);
        UIImageView *icon = [[UIImageView alloc] initWithFrame:iconRect];
        //圆角
        icon.layer.cornerRadius = kUserIconW*0.5;
        icon.layer.masksToBounds = YES;
        icon.userInteractionEnabled = YES;
        [self addSubview:icon];
        self.icon = icon;
        
        //用户名
        NSInteger userNameX = CGRectGetMaxX(iconRect) + 6;
        NSInteger userNameY = 20;
        CGRect userNameRect = CGRectMake(userNameX, userNameY, 100, 20);
        UILabel *userName = [self setUpLabelWithFrame:userNameRect font:17 textColor:kContentColor];
        [self addSubview:userName];
        self.userName = userName;
        
        //用户地址
        NSInteger adressX = CGRectGetMaxX(iconRect) + 6;
        NSInteger adressY = CGRectGetMaxY(userNameRect) + 7;
        
        CGRect adressRect = CGRectMake(adressX, adressY, kAdressBtnW, kAdressBtnH);
        
        UIButton *adressBtn = [[UIButton alloc] initWithFrame:adressRect];
//        adressBtn.backgroundColor= [UIColor redColor];
        
        [adressBtn setImage:[UIImage imageNamed:@"positioning"] forState:(UIControlStateNormal)];
        
        adressBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        adressBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [adressBtn setTitleColor:kAdressColor forState:(UIControlStateNormal)];
        [adressBtn setTitleColor:kAdressColor forState:(UIControlStateHighlighted)];
        adressBtn.titleLabel.font = kAdressBtnFont;
        
        [self addSubview:adressBtn];
        self.adress = adressBtn;
        //时间
#warning 时间的长短变化 暂定设为100(应该是根据数据源)
        NSInteger timeW = 80;
        NSInteger timeX = self.width - timeW - 23;
        NSInteger timeY = kCellTopViewHeight/2 - 10;
        CGRect timeRect = CGRectMake(timeX, timeY, timeW, 20);
        UILabel *time = [self setUpLabelWithFrame:timeRect font:13 textColor:kAdressColor];
        [self addSubview:time];
        self.time = time;
        //发表的内容
        NSInteger contentX = 10;
        NSInteger contentY = CGRectGetMaxY(icon.frame) + 14;

        CGRect contentRect = CGRectMake(contentX, contentY, self.width - 2*contentX, 0);
        UILabel *content = [self setUpLabelWithFrame:contentRect font:15 textColor:kContentColor];
        
        content.adjustsFontSizeToFitWidth = YES;
        content.numberOfLines = 0;
        [self addSubview:content];
        self.content = content;

    }
    return self;
}

- (UILabel *)setUpLabelWithFrame:(CGRect)frame font:(CGFloat)fontNum textColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    [label setFont:[UIFont systemFontOfSize:fontNum]];
    [label setTextColor:color];
    return label;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
