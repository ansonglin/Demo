//
//  RYPublicViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabViewController.h"
#import "RYBookModel.h"

@interface RYPublicViewController : RYTabViewController

@property (nonatomic, strong) RYBookModel *model;

// 接收展开按钮的状态
@property (nonatomic) BOOL rowState;

// 设置一个tag值,来区分是那个页面传值来给headerView赋值
@property (nonatomic, assign) NSInteger headerTag;

@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, assign) NSInteger section;

@end
