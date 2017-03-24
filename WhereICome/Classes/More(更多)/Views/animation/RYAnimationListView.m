//
//  RYAnimationListView.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAnimationListView.h"

@implementation RYAnimationListView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
        self.tableView.delegate = delegate;
        self.tableView.dataSource = delegate;
        
        _tableView.bounces = NO;
        [self addSubview:_tableView];
    }
    return self;
}
@end
