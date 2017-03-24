//
//  RYSelectView.h
//  WhereICome
//
//  Created by mkq on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  足迹界面的地点 权限 显示视图

#import <UIKit/UIKit.h>

@class RYSelectView;
@protocol RYSelectViewDelegate <NSObject>

- (void)selectView:(RYSelectView *)selectView didClick:(UITapGestureRecognizer *)tap;

@end


@interface RYSelectView : UIView


+ (instancetype)selectViewWithFrame:(CGRect)frame;

/*
 *  标题
 */
@property (nonatomic, weak)UILabel *detailLabel;
/**
 *  子标题
 */
@property (nonatomic, weak)UILabel *subLabel;

@property (nonatomic, assign)id<RYSelectViewDelegate> delegate;

@end
