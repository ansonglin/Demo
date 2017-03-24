//
//  RYMeViewController.m
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
// cell之间的间距
#define RYCellMargin 10

// cell的内边距
#define RYCellInset 13

#import "RYMeViewController.h"
#import "RYMeCell.h"
#import "RYProfileGroup.h"
#import "RYMeHeaderView.h"
#import "RYGrowViewController.h"
#import "RYSignController.h"
#import "RYPhotoAblumController.h"
#import "RYCenterViewController.h"
#import "RYRemarkVController.h"

@interface RYMeViewController ()
/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray *datas;

@end


@implementation RYMeViewController

/** 屏蔽tableView的样式 */
- (id)init
{
    return [self initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //配置tableView
    [self configTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO; 
}

- (void)configTableView
{
    //headerView
    RYMeHeaderView *headerView = [RYMeHeaderView headerView];
    headerView.frame = CGRectMake(0, 0, kScreenW, 360);
    
    [headerView.backBtn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    //相册按钮点击的回调
    __weak typeof(self) weakSelf = self;
    headerView.photoBlock = ^{
        RYPhotoAblumController *photoVc = [[RYPhotoAblumController alloc] init];
        [weakSelf.navigationController pushViewController:photoVc animated:YES];
    };
    //签到按钮的回调
    headerView.signBlock = ^{
        RYSignController *calendar = [[RYSignController alloc] init];
        [weakSelf.navigationController pushViewController:calendar animated:YES];
        
    };
    
    self.tableView.tableHeaderView = headerView;

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = RYColor(242, 242, 242      );
    // 设置tableView属性
    self.tableView.sectionFooterHeight = RYCellMargin;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.contentInset = UIEdgeInsetsMake(RYCellMargin - 35, 0, 0, 0);
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark UITableView代理和数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RYProfileGroup *group = [self.datas objectAtIndex:section];
    return group.profils.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYMeCell *cell = [RYMeCell cellWithTableView:tableView];
    //取出模型数据
    RYProfileGroup *group = [self.datas objectAtIndex:indexPath.section];
    RYProfile *pro = [group.profils objectAtIndex:indexPath.row];
    //给数据
    cell.profile = pro;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        // 个人中心
        RYCenterViewController *centerVC = [[RYCenterViewController alloc] init];
        [self.navigationController pushViewController:centerVC animated:YES];
    } else if (indexPath.row == 3) {
        // 我的备注
        RYRemarkVController *remark = [[RYRemarkVController alloc] init];
        [self.navigationController pushViewController:remark animated:YES];
    } else if (indexPath.row == 4) {
        // 成长日志
        RYGrowViewController *growVC = [[RYGrowViewController alloc] init];
        [self.navigationController pushViewController:growVC animated:YES];
    }
    RYLog(@"ddd");
}


#pragma mark  懒加载
- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
        
        NSArray *arr1 = @[
                         @{
                             @"icon":@"mirror",
                             @"text":@"我的主页",
                             },
                         @{
                             @"icon":@"Create_group",
                             @"text":@"创建小组",
                             },
                         @{
                             @"icon":@"Personal_center",
                             @"text":@"个人中心",
                             },
                         @{
                             @"icon":@"memo",
                             @"text":@"我的备注",
                             },
                         @{
                             @"icon":@"Growth_log",
                             @"text":@"成长日记",
                             },
                         
                         ];
        
//        NSArray *arr2 = @[
//                         @{
//                             @"icon":@"exit",
//                             @"text":@"退出",
//                             },
//                         ];
        //字典转模型
        RYProfileGroup *group1 = [RYProfileGroup group];
        for (int i = 0; i < arr1.count; i++) {
            NSDictionary *dict = [arr1 objectAtIndex:i];
            RYProfile *profile = [RYProfile profileWithDict:dict];
            [group1.profils addObject:profile];
        }
        
//        RYProfileGroup *group2 = [RYProfileGroup group];
//        for (int i = 0; i < arr2.count; i++) {
//            NSDictionary *dict = [arr2 objectAtIndex:i];
//            RYProfile *profile = [RYProfile profileWithDict:dict];
//            [group2.profils addObject:profile];
//        }
        
        [_datas addObject:group1];
//        [_datas addObject:group2];
        
    }
    return _datas;
}


@end
