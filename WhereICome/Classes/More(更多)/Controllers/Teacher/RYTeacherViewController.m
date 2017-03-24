//
//  RYTeacherViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTeacherViewController.h"
#import "RYTeacherTableViewCell.h"
#import "RYBookModel.h"
#import "RYPublicViewController.h"

#define HEIGHTFORROW 130

@interface RYTeacherViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *dateArray;
}

@end

@implementation RYTeacherViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    [self datas];
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark UITableView的代理方法和实现
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *arr = [NSArray arrayWithObjects:@"数学", @"语文", @"地理", @"英语", nil];
    return [arr objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHTFORROW;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellStr = @"cell";
    RYTeacherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell = [[RYTeacherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
    }
    
    RYBookModel *model = [dateArray objectAtIndex:indexPath.section];
    cell.Image.image = [UIImage imageNamed:model.labelImage];
    cell.nameLabel.text = model.labelTitle;
    cell.labelContent.text = model.labelContent;
    cell.labelTool.label.text = model.labelTag;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYPublicViewController *publicView = [[RYPublicViewController alloc] init];
    publicView.model = [dateArray objectAtIndex:indexPath.section];
    publicView.headerTag = 1;
    publicView.section = indexPath.section;
    [self.navigationController pushViewController:publicView animated:YES];
}

// 加载测试数据
- (void)datas
{
    dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSArray *dict = @[
                          @{
                           @"labelTitle":@"吴正宪",
                           @"labelContent":@"吴正宪, 女, 数学特级教师, 北京市优秀教师, 全国模范教师, 北京市政协委员, 现任北京市科教院教导员.擅长与学生之间互动交流,对学生负责,让家长放心,是一个很优秀的教师.平时也很注重教学上的创新,会中西结合,引进国外先进的教学方式,先进的教学理念,做到对每一个孩子负责",
                           @"labelTag":@"教育 励志 成长",
                           @"labelImage":@"teacher_headpic_a",
                           @"labelClass1":@"数学",
                           @"labelClass2":@"小学一,二,三年级",
                           @"labelClass3":@"关注学生切实需求,注重学生能力培养,关注学生切实需求,注重学生能力培养",
                           },
                          @{
                            @"labelTitle":@"贾志敏",
                            @"labelContent":@"贾志敏, 男, 上海市人, 从事小学教育工作已经50多年. 1992年电视系列教学片<贾老师教作文>的作者.擅长与学生之间互动交流,对学生负责,让家长放心,是一个很优秀的教师.平时也很注重教学上的创新,会中西结合,引进国外先进的教学方式,先进的教学理念,做到对每一个孩子负责",
                            @"labelTag":@"特级教师 冒险 成长",
                            @"labelImage":@"teacher_headpic_b",
                            @"labelClass1":@"语文",
                            @"labelClass2":@"小学一,二年级",
                            @"labelClass3":@"孩子最大",
                            },
                      ];
    NSArray *dict2 = @[
                           @{
                            @"labelTitle":@"靳家彦",
                            @"labelContent":@"靳家彦, 男, 1944年12月生. 地理特级教师,擅长与学生之间互动交流,对学生负责,让家长放心,是一个很优秀的教师.平时也很注重教学上的创新,会中西结合,引进国外先进的教学方式,先进的教学理念,做到对每一个孩子负责",
                            @"labelTag":@"励志 成长 心理健康",
                            @"labelImage":@"teacher_headpic_c",
                            @"labelClass1":@"地理",
                            @"labelClass2":@"小学三年级",
                            @"labelClass3":@"爱与孩子一起玩的老师",
                            },
                            @{
                            @"labelTitle":@"李吉林",
                            @"labelContent":@"李吉林, 女, 儿童教育专家. 全国著名的英语教育专家, 1938年5月出生, 江苏省南通市人, 共产党人,擅长与学生之间互动交流,对学生负责,让家长放心,是一个很优秀的教师.平时也很注重教学上的创新,会中西结合,引进国外先进的教学方式,先进的教学理念,做到对每一个孩子负责",
                            @"labelTag":@"特级教师 智力 音乐",
                            @"labelImage":@"teacher_headpic_d",
                            @"labelClass1":@"英语",
                            @"labelClass2":@"小学二,三年级",
                            @"labelClass3":@"懂得如何和孩子相处",
                                },
                            ];
    [tempArr addObject:dict];
    [tempArr addObject:dict2];
    
    
    for (NSArray *dict in tempArr) {
        for (NSDictionary *d in dict) {
            RYBookModel *bookModel = [[RYBookModel alloc] init];
            [bookModel setValuesForKeysWithDictionary:d];
            [dateArray addObject:bookModel];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareFor
 Segue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
