//
//  RYRemarkVController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYRemarkVController.h"
#import "RYNewRemarkController.h"
#import "RYRemarkTableViewCell.h"

@interface RYRemarkVController ()<UITableViewDataSource,UITableViewDelegate,RYNewRemarkControllerDelegate>

@end

@implementation RYRemarkVController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configNav];
    [self createTable];
    
    
}

/**
 *  配置导航栏
 */
- (void)configNav
{
    // 创建备注按钮
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"me_remark"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(addNewRemark:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(kScreenW - 40, 0, 30, 44);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.title = @"我的备注";
    // 返回按钮
    UIButton *btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image1 = [UIImage imageNamed:@"return_black"];
    [btn1 setImage:image1 forState:(UIControlStateNormal)];
    [btn1 addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn1.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    
}
// 开始进入新建备注页面
- (void)addNewRemark:(UIButton *)sender
{
    RYNewRemarkController *newRemark = [[RYNewRemarkController alloc] init];
    newRemark.delegate = self;
    [self.navigationController pushViewController:newRemark animated:YES];
}
#pragma mark 实现代理方法
- (void)getNewTime:(NSString *)newTime
{
    _timeStr = newTime;
    [self.tableView reloadData];
}
- (void)getNewRemark:(NSString *)newRemark
{
    _remarkStr = newRemark;
    [self.tableView reloadData];
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 创建视图
- (void)createTable
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.tableView registerClass:[RYRemarkTableViewCell class] forCellReuseIdentifier:@"tableviewCell"];
    [self.view addSubview:_tableView];
}

#pragma mark UITableView的代理方法和实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYRemarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableviewCell"];
    if (self) {
        cell = [[RYRemarkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableviewCell"];
    }
    if (_remarkStr != nil) {
        cell.labelRemark.text = _remarkStr;
        cell.labelDate.text = _timeStr;
    }
    
   
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
