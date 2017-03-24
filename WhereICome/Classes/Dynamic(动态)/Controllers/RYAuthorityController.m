//
//  RYAuthorityControllerViewController.m
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAuthorityController.h"
#import "RYAuthorCell.h"
@interface RYAuthorityController ()

@property (nonatomic, strong)NSMutableArray *datas;


@end

@implementation RYAuthorityController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //配置tableView
    [self configTableView];
    //配置导航栏
    [self configNav];
}
- (void)configNav
{
    //左按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [btn setImage:[UIImage imageNamed:@"return_black"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //titleView
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [titleView setText:@"选择分享范围"];
//    [titleView setFont:[UIFont systemFontOfSize:15]];
    self.navigationItem.titleView = titleView;
}
- (void)configTableView
{
    self.tableView.backgroundColor = RYColorFromRGB(0Xececec);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"oathCellId";
    RYAuthorCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[RYAuthorCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellId];
    }
    NSDictionary *dict = [self.datas objectAtIndex:indexPath.row];
    NSString *icon = [dict objectForKey:@"icon"];
    NSString *scope = [dict objectForKey:@"scope"];
    NSString *subTitle = [dict objectForKey:@"subTitle"];
    cell.imageView.image = [UIImage imageNamed:icon];
    cell.textLabel.text = scope;
    cell.detailTextLabel.text = subTitle;
    
//    cell.textLabel.text = @"哈哈";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *authorText = cell.textLabel.text;
    if ([self.delegate respondsToSelector:@selector(authorityController:WithSelectAuthor:)]) {
        [self.delegate authorityController:self WithSelectAuthor:authorText];
    }
    [self back];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark 懒加载

- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
        
        NSDictionary *dict0 = @{
                               @"icon":@"family_ties",
                               @"scope":@"公开",
                               @"subTitle":@"所有人可见",
                               };
        NSDictionary *dict1 = @{
                               @"icon":@"family_ties",
                               @"scope":@"好友圈",
                               @"subTitle":@"相互关注的好友可见",
                               };
        NSDictionary *dict2 = @{
                               @"icon":@"family_ties",
                               @"scope":@"仅自己可见",
                               @"subTitle":@"",
                               };
        [_datas addObject:dict0];
        [_datas addObject:dict1];
        [_datas addObject:dict2];
        
    }
    return _datas;
}

- (void)back
{
//    [UIView animateWithDuration:0.5 animations:^{
//        self.view.y = kScreenH;
//    } completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:YES];
//    }];
}
@end
