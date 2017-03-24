//
//  RYConnectionView.m
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYConnectionView.h"

@implementation RYConnectionView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置背景颜色
        self.backgroundColor = [UIColor whiteColor];
        // 对数组进行初始化
        self.treeOpenArray = [NSMutableArray array];
        self.treeResultArray = [NSMutableArray array];
#pragma mark 创建UITableView
        if (self.tableView == nil || self.tableView == NULL) {
            self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 113) style:UITableViewStylePlain];
            self.tableView.delegate = delegate;
            self.tableView.dataSource = delegate;
            
            // UITableView当分组人数很少的时候，去掉多余的cell分割线
            UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
            [self.tableView setTableFooterView:view];
            
            [self addSubview:self.tableView];
            
            // 设置UITableView的分割线的尺寸
            if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
                [self.tableView setSeparatorInset:UIEdgeInsetsZero];
            }
        }
    }
    return self;
}

@end
