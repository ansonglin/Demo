//
//  RYCenterView.h
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYCenterView : UIView

// 用来显示宝宝个人信息
@property (nonatomic, strong) UITableView *tableView;
// 创建UIPickerView用来显示省市区信息
@property (nonatomic, strong) UIPickerView *pickerView;
// 用来确认选中的省市区
@property (nonatomic, strong) UIToolbar *toolbar;


@end
