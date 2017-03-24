//
//  RYActivityViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYActivityViewController.h"
#import "RYActivityTableViewCell.h"

@interface RYActivityViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dateArray;

@end

@implementation RYActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"亲子活动";
    [self.tableView registerClass:[RYActivityTableViewCell class] forCellReuseIdentifier:@"activitycell"];
    [self dates];
}
#pragma mark -
#pragma mark UITableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dateArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"activitycell"];
    if (!cell) {
        cell = [[RYActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"activitycell"];
    }
    NSDictionary *dic = [_dateArray objectAtIndex:indexPath.row];
    NSString *str = [dic objectForKey:@"image"];
    cell.bigImage.image = [UIImage imageNamed:str];
    
    // 判断如果活动已经结束则显示为白色, 不是则为黑色
    NSString *titlestr = [dic objectForKey:@"title"];
    if ([titlestr isEqualToString:@"活动也结束"]) {
        cell.labelTag.textColor = [UIColor grayColor];
        cell.labelTag.text = titlestr;
    } else {
        cell.labelTag.textColor = [UIColor blackColor];
        cell.labelTag.text = titlestr;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)dates
{
    _dateArray = [NSMutableArray array];
    NSDictionary *dic1 = @{
                           @"title":@"春天来了, 小朋友一起来讲故事吧",
                        @"image":@"collection_activity_a",
                           };
    NSDictionary *dic2 = @{
                           @"title":@"活动也结束",
                           @"image":@"collection_activity_b",
                           };
    NSDictionary *dic3 = @{
                           @"title":@"活动也结束",
                           @"image":@"collection_activity_c",
                           };
    NSDictionary *dic4 = @{
                           @"title":@"活动也结束",
                           @"image":@"collection_activity_d",
                           };
    [_dateArray addObject:dic1];
    [_dateArray addObject:dic2];
    [_dateArray addObject:dic3];
    [_dateArray addObject:dic4];
    
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
