//
//  RYGrowOnlyTextCell.h
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYGrowOnlyTextCell : UITableViewCell

// 成长日志时间
@property (nonatomic, strong) UILabel *labelTime;

// 成长日志内容
@property (nonatomic, strong) UILabel *labelContent;

// 成长日志年龄
@property (nonatomic, strong) UILabel *labelAge;

// 创建灰色的竖线
@property (nonatomic, strong) UILabel *labelLine;

// 白色背景图
@property (nonatomic, strong) UIView *viewA;

// 权限
@property (nonatomic, strong) UILabel *labelJude;

@end
