//
//  RYMeHeaderView.h
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabViewController.h"


typedef void(^headerViewCallBackBlock)();

@interface RYMeHeaderView : UIView

/**
 *  快速创建一个对象
 */
+ (instancetype)headerView;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
/**
 *  查看相册按钮点击的回调
 */
@property (copy, nonatomic)headerViewCallBackBlock photoBlock;
/**
 *  签到按钮点击的回调
 */
@property (copy, nonatomic)headerViewCallBackBlock signBlock;

@end
