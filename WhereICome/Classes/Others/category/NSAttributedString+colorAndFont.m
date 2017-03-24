//
//  NSAttributedString+colorAndFont.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "NSAttributedString+colorAndFont.h"

@implementation NSAttributedString (colorAndFont)

+ (instancetype)attributedStringWithString:(NSString *)string Color:(UIColor *)color font:(UIFont *)font
{
    if(!string) return nil;
    
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:string];
    [attributed addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, string.length)];
    
    [attributed addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    
    return attributed;
}
@end
