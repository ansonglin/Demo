//
//  RYPhotosView.h
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
//图片最大个数
#define kMaxImageCount   9
//图片距离左右的间距
#define kimageMargin     10
//图片之间的距离
#define kimageViewPadding 2
//每行图片个数
#define kimageViewRowCount 3

#define kimageViewH  100

#define kimageViewW (self.frame.size.width - kimageMargin*(kimageViewRowCount-1) - kimageViewPadding*(kimageViewRowCount-1)) / kimageViewRowCount


#import <UIKit/UIKit.h>

@interface RYPhotosView : UIView
/**
 *  需要显示的图片
 */
@property (nonatomic, strong)NSArray *photosData;

/**
 *  该视图显示的高度
 */
@property (nonatomic, assign)CGFloat photosViewHeight;

@end
