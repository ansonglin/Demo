//
//  RYTeacherTableViewCell.h
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYTeacherTool.h"

@interface RYTeacherTableViewCell : UITableViewCell

// 老师图片
@property (nonatomic, strong) UIImageView *Image;

// 老师名字
@property (nonatomic, strong) UILabel *nameLabel;

// 老师简介
@property (nonatomic, strong) UILabel *labelContent;

// 老师标签
@property (nonatomic, strong) RYTeacherTool *labelTool;

// 收藏按钮
@property (nonatomic, strong) UIButton *button;

@property (nonatomic) BOOL state;

@end
