//
//  RYDynamicCell.h
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYDynamicFrame.h"
#import "RYToolBar.h"
#import "RYTopView.h"
#import "RYPhotosView.h"

@interface RYDynamicCell : UITableViewCell
/**
 *  快速返回tableView的cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  子控件的frame
 */
@property (nonatomic, strong)RYDynamicFrame *dynamicFrame;

/**
 *  顶部信息
 */
@property (nonatomic ,weak)RYTopView * topView;

/**
 *  照片视图
 */
@property (nonatomic ,weak)RYPhotosView *photos;

/**
 *  工具条
 */
@property (nonatomic ,weak)RYToolBar *toolBar;

@end
