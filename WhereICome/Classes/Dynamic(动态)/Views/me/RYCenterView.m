//
//  RYCenterView.m
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCenterView.h"

@implementation RYCenterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self) {
        // 创建UITableView
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
        [self addSubview:_tableView];
        
        // 创建UIToolbar
        self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, kScreenH - 110, kScreenW, 30)];
        _toolbar.hidden = YES;
        [self addSubview:_toolbar];
        
        // 创建UIPickerView
        self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenH - 80, kScreenW, 80)];
        _pickerView.hidden = YES;
        [self addSubview:_pickerView];
       
    }
    return self;
}


@end
