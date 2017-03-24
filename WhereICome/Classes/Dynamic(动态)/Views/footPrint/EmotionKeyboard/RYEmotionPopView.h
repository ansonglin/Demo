//
//  RYEmotionPopView.h
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.


#import <UIKit/UIKit.h>
@class RYEmotionView;

@interface RYEmotionPopView : UIView
+ (instancetype)popView;

/**
 *  显示表情弹出控件
 *
 *  @param emotionView 从哪个表情上面弹出
 */
- (void)showFromEmotionView:(RYEmotionView *)fromEmotionView;
- (void)dismiss;
@end
