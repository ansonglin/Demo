//
//  UIView+corner.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "UIView+corner.h"

@implementation UIView (corner)

- (void)setUpViewCornerWidth:(NSInteger)cornerWidth withBorderColor:(UIColor *)borderColor withBorder:(NSInteger)corner
{
    self.layer.cornerRadius = corner;
    self.layer.borderWidth = cornerWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.masksToBounds = YES;
}
@end
