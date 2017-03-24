//
//  RYSchoolsViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYSchoolsViewController.h"

#import "RYBookModel.h"
#import "RYCollectionBookTVCell.h"
#import "RYPublicViewController.h"


#define HEIGHTFORROW 111


@interface RYSchoolsViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *dateArray;
}


@end

@implementation RYSchoolsViewController

- (void)dealloc
{
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 当push到当前页面时隐藏tabbar
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self datas];
    self.view.backgroundColor = [UIColor whiteColor];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHTFORROW;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strID = @"cell";
    RYCollectionBookTVCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell = [[RYCollectionBookTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    
    RYBookModel *model = [dateArray objectAtIndex:indexPath.row];
    
    cell.ImageView.image = [UIImage imageNamed:model.labelImage];
    cell.labelName.text = model.labelTitle;
    cell.labelContent.text = model.labelContent;
    cell.labelTool.labelTitle.text = model.labelTag;
    cell.labelLoction.text = model.labelLoction;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYPublicViewController *publicView = [[RYPublicViewController alloc] init];
    publicView.model = [dateArray objectAtIndex:indexPath.row];
    publicView.headerTag = 0;
    [self.navigationController pushViewController:publicView animated:YES];
}

// 加载测试数据
- (void)datas
{
    dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"labelTitle":@"Methodist Girls’ School ",
                           @"labelContent":@"卫理公会女子学校（MGS）是一所女子独立学校，由两部分–小学和中学，位于武吉知，新加坡。第二部分是英华学校附属（独立）（“ACS（I）”），并有一个共同的集成方案（“IP”）让学生将ACS（I）在5年与ACS完成6 IP（我）队列，不以“O”水平。私立预科学校有一个学术史，音乐和体育运动卓越，是新加坡的一个高级中学。",
                           @"labelTag":@"知名国际学校",
                           @"labelLoction":@"9.0km",
                           @"labelImage":@"pic_songqingling",
                           @"labelAge":@"0-1岁,1-3岁,3-5岁,5-7岁...",
                           @"labelLoad":@"上海市徐汇区田林路98号",
                           };
    NSDictionary *dict1 = @{
                            @"labelTitle":@"上海维多利亚幼儿园",
                            @"labelContent":@"致力于创建优良的教与学环境，凝聚专业力量，在充满关怀、信任、尊重和包容的氛围中，使幼儿尽展多元潜能，促进其健康和谐的成长。致力于创建优良的教与学环境，凝聚专业力量，在充满关怀、信任、尊重和包容的氛围中，使幼儿尽展多元潜能，促进其健康和谐的成长。致力于创建优良的教与学环境，凝聚专业力量，在充满关怀、信任、尊重和包容的氛围中，使幼儿尽展多元潜能，促进其健康和谐的成长。",
                            @"labelTag":@"双语教学 历史悠久",
                            @"labelLoction":@"4.5km",
                            @"labelImage":@"pic_weiduoliya",
                            @"labelAge":@"3-7岁...",
                            @"labelLoad":@"上海市徐汇区宜山路路98号",
                            };
    NSDictionary *dict2 = @{
                            @"labelTitle":@"上海市实验幼儿园",
                            @"labelContent":@"实验幼儿园构建融健康保障、健康服务、健康教育课程和健康评价为一体的幼儿园“健康教育”的课程体系，以“提升每一位孩子的健康生活品质”为重点，不断提升保教质量和办园品质。实验幼儿园构建融健康保障、健康服务、健康教育课程和健康评价为一体的幼儿园“健康教育”的课程体系，以“提升每一位孩子的健康生活品质”为重点，不断提升保教质量和办园品质。",
                            @"labelTag":@"上海市示范性幼儿园",
                            @"labelLoction":@"3.33km",
                            @"labelImage":@"pic_shiyan",
                            @"labelAge":@"1-3岁,3-5岁,5-7岁...",
                            @"labelLoad":@"上海市虹口区中山北一路98号",
                            };
    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    
    
    for (NSDictionary *dict in tempArr) {
        RYBookModel *bookModel = [[RYBookModel alloc] init];
        [bookModel setValuesForKeysWithDictionary:dict];
        [dateArray addObject:bookModel];
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
