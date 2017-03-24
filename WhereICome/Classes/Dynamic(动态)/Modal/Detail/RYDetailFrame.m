//
//  RYDetailFrame.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define kiconH 40
#define kuserNameH 20


#import "RYDetailFrame.h"
#import "NSString+TextSize.h"

@implementation RYDetailFrame


- (void)setDetail:(RYDetail *)detail
{
    _detail = detail;
    
    NSInteger iconX = 10;
    NSInteger iconY = 10;
    NSInteger iconW = 40;
    NSInteger iconH = kiconH;
    CGRect iconRect = CGRectMake(iconX, iconY, iconW, iconH);
    self.iconFrame = iconRect;
    //用户名
    NSInteger userNameX = 10 + CGRectGetMaxX(iconRect);
    NSInteger userNameY = 13;
    NSInteger userNameH = 20;
    //计算名字的宽度
    CGSize userNameSize = [detail.userName sizeWithFont:[UIFont boldSystemFontOfSize:18] maxSize:CGSizeMake(kScreenW, MAXFLOAT)];
    
    NSInteger userNameW = userNameSize.width;
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameW, userNameH);
    self.userNameFrame = userNameRect;
    //时间
    NSInteger timeX = 10 + CGRectGetMaxX(userNameRect);
    NSInteger timeY = 13;
    NSInteger timeW = 100;
    NSInteger timeH = 20;
    CGRect timeRect = CGRectMake(timeX, timeY, timeW, timeH);
    self.timeFrame = timeRect;
    //内容
    NSInteger conX = userNameX;
    NSInteger conY = 5 + CGRectGetMaxY(userNameRect);
    NSInteger conW = kScreenW - conX - 10;
    CGSize maxSize = CGSizeMake(kScreenW - iconW - 10 - 10, MAXFLOAT);
    CGSize contentSize = [detail.commentCon sizeWithFont:[UIFont systemFontOfSize:14] maxSize:maxSize];
    
    CGRect conRect = CGRectMake(conX, conY, conW, contentSize.height);
    self.commentConFrame = conRect;
    
    //cell 的总高度
    self.cellHeight = CGRectGetMaxY(conRect) + 10;
    
}

@end
