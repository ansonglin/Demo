//
//  NSString+TextSize.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "NSString+TextSize.h"

@implementation NSString (TextSize)
/*
 *  @param font    字体
 *  @param maxSize 最大尺寸
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{//计算字符串的宽高
    
    NSDictionary *attr = @{NSFontAttributeName:font};
    CGSize textSize;
    if (iOS7) {
        //iOS7的情况下
        textSize = [self boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin) attributes:attr context:nil].size;
    }else{
        //小于iOS7 的情况下
        textSize = [self sizeWithFont:font constrainedToSize:maxSize lineBreakMode:(NSLineBreakByClipping)];
    }
    
    //这个方法在ios7后可以使用
    return textSize;
}
@end
