//
//  RYClassTableViewCell.h
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYBookTools.h"

@interface RYClassTableViewCell : UITableViewCell
// 课堂图片
@property (nonatomic, strong) UIImageView *imageA;

// 课堂名
@property (nonatomic, strong) UILabel *labelName;

// 课堂老师
@property (nonatomic, strong) UILabel *labelTea;

// 课堂标签
@property (nonatomic, strong) RYBookTools *labelTools;

@end
