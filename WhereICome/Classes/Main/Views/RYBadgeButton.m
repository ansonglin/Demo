//
//  RYBadgeButton.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYBadgeButton.h"
#import "UIImage+resize.h"

@implementation RYBadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.hidden = YES;//默认隐藏
        self.userInteractionEnabled = NO;
        self.titleLabel.font = [UIFont systemFontOfSize:10];
#warning 暂时没这个图片
//        [self setBackgroundImage:[UIImage resizeImageWithName:@"main_badge"] forState:(UIControlStateNormal)];
    }
    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    //当传入的badgeValue 是空值  隐藏
    if (badgeValue) {
        self.hidden = NO;
        [self setTitle:badgeValue forState:(UIControlStateNormal)];
        //设置frame
        CGRect frame = self.frame;
        //计算文字尺寸  这个地方只计算这个button的大小 button的相对位置需要由父控件决定
        CGSize textSize = [badgeValue sizeWithFont:[UIFont systemFontOfSize:10]];
        
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            badgeW = textSize.width+10;
        }
        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
    }else{
        self.hidden = YES;
    }
}
@end
