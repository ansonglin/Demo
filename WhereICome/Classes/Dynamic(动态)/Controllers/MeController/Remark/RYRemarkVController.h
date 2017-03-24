//
//  RYRemarkVController.h
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYRemarkVController : UIViewController

@property (nonatomic, strong) UITableView *tableView;

// 当前时间和日期
@property (nonatomic, copy) NSString *timeStr;

// 获取新建备注
@property (nonatomic, copy) NSString *remarkStr;

@end
