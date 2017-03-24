//
//  RYPhotosView.h
//  WhereICome
//
//  Created by mkq on 15/6/9.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  图片发表视图

#import <UIKit/UIKit.h>

@interface RYFootPrintPhotosView : UIView
/**
 *  添加一张图片到相册内部
 *
 *  @param image 新添加的图片
 */
- (void)addImage:(UIImage *)image;

- (NSArray *)images;

@end
