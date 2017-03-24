//
//  RYDetailController.h
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabViewController.h"
@class RYDynamicFrame;

@interface RYDetailController : RYTabViewController
/**
 *   headerView 的数据源
 */
@property (nonatomic, strong)RYDynamicFrame *dynamicFrame;

@end
