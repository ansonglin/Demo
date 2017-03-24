//
//  RYNewRemarkController.h
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTextView.h"

// 创建代理返回时间
@protocol RYNewRemarkControllerDelegate <NSObject>

// 获取当前时间
- (void)getNewTime:(NSString *)newTime;

// 获取新建备注
- (void)getNewRemark:(NSString *)newRemark;

@end

@interface RYNewRemarkController : UIViewController

// 设置代理对象
@property (nonatomic, assign) id<RYNewRemarkControllerDelegate>delegate;

// 当前时间
@property (nonatomic, copy) NSString *newtime;

// 新建备注
@property (nonatomic, copy) NSString *newreamrk;

// 备注文本框
@property (nonatomic, strong) RYTextView *textView;

// 删除按钮
@property (nonatomic, strong) UIButton *deleteBtn;

// 确定删除备注按钮
@property (nonatomic, strong) UIButton *deleteSure;

// 取消删除按钮
@property (nonatomic, strong) UIButton *deleteCancel;

@end
