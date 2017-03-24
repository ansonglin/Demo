//
//  NSAttributedString+colorAndFont.h
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (colorAndFont)
/**
 *  给指定的字符串添加 颜色 和 字体 大小
 */
+ (instancetype)attributedStringWithString:(NSString *)string Color:(UIColor *)color font:(UIFont *)font;

@end
