//
//  UIView+corner.h
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (corner)
/**
 *  为一个View设置圆角
 *
 *  @param cornerWidth 圆角边界宽
 *  @param borderColor 圆角边界的颜色
 *  @param corner      圆角大小
 */
- (void)setUpViewCornerWidth:(NSInteger)cornerWidth withBorderColor:(UIColor *)borderColor withBorder:(NSInteger)corner;
@end
