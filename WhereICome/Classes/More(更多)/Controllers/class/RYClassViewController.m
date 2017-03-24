//
//  RYClassViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYClassViewController.h"
#import "RYClassTableViewCell.h"
#import "RYBookModel.h"

@interface RYClassViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *dateArray;

@end

@implementation RYClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[RYClassTableViewCell class] forCellReuseIdentifier:@"classcell"];
    [self dates];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableView的代理方法和实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dateArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"classcell"];
    if (!cell) {
        cell = [[RYClassTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"classcell"];
    }
    
    RYBookModel *model = [_dateArray objectAtIndex:indexPath.row];
    cell.imageA.image = [UIImage imageNamed:model.labelImage];
    cell.labelName.text = model.labelTitle;
    cell.labelTea.text = model.labelName;
    cell.labelTools.labelTitle.text = model.labelTag;
    
    
    return cell;
}

- (void)dates
{
    _dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"labelTitle":@"动物简笔画教学 初级 (一)",
                           @"labelContent":@"",
                           @"labelTag":@"教育 冒险 励志 成长",
                           @"labelName":@"王光教授",
                           @"labelLoction":@"",
                           @"labelImage":@"more_class_a",
                           };
    NSDictionary *dict1 = @{
                            @"labelTitle":@"小儿推拿常用穴位及手法",
                            @"labelContent":@"",
                            @"labelTag":@"冒险 成长 励志",
                            @"labelName":@"张海教授",
                            @"labelLoction":@"",
                            @"labelImage":@"more_class_b",
                            };
    NSDictionary *dict2 = @{
                            @"labelTitle":@"动物简笔画教程 高级",
                            @"labelContent":@"",
                            @"labelName":@"安安教授",
                            @"labelTag":@"教育 励志 成长",
                            @"labelLoction":@"",
                            @"labelImage":@"more_class_c",
                            };
    NSDictionary *dict3 = @{
                            @"labelTitle":@"经典儿童故事",
                            @"labelContent":@"",
                            @"labelName":@"何生教授",
                            @"labelTag":@"教育 励志 成长",
                            @"labelLoction":@"",
                            @"labelImage":@"more_class_d",
                            };
    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    [tempArr addObject:dict3];
    
    for (NSDictionary *dict in tempArr) {
        RYBookModel *bookModel = [[RYBookModel alloc] init];
        [bookModel setValuesForKeysWithDictionary:dict];
        [_dateArray addObject:bookModel];
    }

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
