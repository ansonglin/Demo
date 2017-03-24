//
//  RYConnectionView.h
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYConnectionView : UIView

@property (nonatomic, strong) UITableView *tableView;

///每个分组的数组
@property(strong, nonatomic) NSMutableArray *treeResultArray;
///判断是否展开或者合上的分组数组.
@property (strong, nonatomic) NSMutableArray *treeOpenArray;
///判断是否展开或者合上的字符串.
@property (strong, nonatomic) NSString *treeOpenString;


// RYConnectionView的初始化方法
- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate;


@end
