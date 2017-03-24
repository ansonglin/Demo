//
//  RYMoreView.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMoreView.h"

@implementation RYMoreView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 49) style:UITableViewStyleGrouped];
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
#pragma mark UITableView当分组人数很少的时候，去掉多余的cell分割线
        UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
        [self.tableView setTableFooterView:view];
        [self addSubview:_tableView];
    }
    return self;
}

@end
