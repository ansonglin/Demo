//
//  UIImage+resize.h
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (resize)
/**
 *  返回一个拉伸过后的图片
 *
 *  @param imageName 图片名字
 */
+ (UIImage *)resizeImageWithName:(NSString *)imageName;

@end
