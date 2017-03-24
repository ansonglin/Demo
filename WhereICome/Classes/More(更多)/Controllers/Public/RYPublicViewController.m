

//
//  RYPublicViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPublicViewController.h"
#import "RYPublicTableViewCell1.h"
#import "RYPublicTableViewCell2.h"
#import "RYPublicModel.h"
#import "RYTeacherTool.h"
#import "DemoViewController.h"

@interface RYPublicViewController ()<UITableViewDataSource,UITableViewDelegate,RYPublicTableViewCell1Delegate>

{
    NSMutableArray *dateArray;
}

@end

@implementation RYPublicViewController


#pragma mark -
#pragma mark 更多页面里面学校.老师主页.心理专家共同页面的实现
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 注册cell
    [self.tableView registerClass:[RYPublicTableViewCell1 class] forCellReuseIdentifier:@"TableViewCell1"];

    [self.tableView registerClass:[RYPublicTableViewCell2 class] forCellReuseIdentifier:@"TableViewCell2"];

    // 调用方法
    [self dates];
    [self createHeaderViewForTableView];
    [self createCollection];
    
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

// 添加收藏按钮
- (void)createCollection
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(kScreenW - 40, 5, 22.5, 21.5);
    [button setBackgroundImage:[UIImage imageNamed:@"teacher_collection"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}



#pragma mark -
#pragma mark 创建UITableView的headerView
- (void)createHeaderViewForTableView
{
    // 根据tag值来区分headerView是属于那个页面的
    if (_headerTag == 0) {
        // 学校
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        // 学校的图片
        UIImageView *schoolImage = [[UIImageView alloc] initWithFrame:CGRectMake(14, 16, 110, 62)];
        schoolImage.image = [UIImage imageNamed:_model.labelImage];
        [view addSubview:schoolImage];
        
        // 学校的名字
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(130, 16, kScreenW - 150, 16)];
        labelName.text = _model.labelTitle;
        [view addSubview:labelName];
        
        // 学校的学生年龄
        UILabel *labelAge = [[UILabel alloc] initWithFrame:CGRectMake(130, 40, kScreenW - 150, 12)];
        labelAge.font = [UIFont systemFontOfSize:15];
        labelAge.textColor = [UIColor grayColor];
        NSString *strAge = [NSString stringWithFormat:@"年龄: %@", _model.labelAge];
        labelAge.text = strAge;
        [view addSubview:labelAge];
        
        // 学校特色
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(130, 57, kScreenW - 150, 12)];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor grayColor];
        NSString *str = [NSString stringWithFormat:@"特色: %@", _model.labelTag];
        label.text = str;
        [view addSubview:label];
        
        // 学校位置
        UIImageView *imageA = [[UIImageView alloc] initWithFrame:CGRectMake(130, 80, 14, 14)];
        imageA.image = [UIImage imageNamed:@"more_school_location"];
        [view addSubview:imageA];
        
        UILabel *labelA = [[UILabel alloc] initWithFrame:CGRectMake(145, 80, kScreenW - 200, 12)];
        labelA.font = [UIFont systemFontOfSize:13];
        labelA.textColor = [UIColor grayColor];
        labelA.text = _model.labelLoad;
        [view addSubview:labelA];
        
        // 学校距离
        UILabel *labelB = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW - 50, 80, 45, 12)];
        labelB.font = [UIFont systemFontOfSize:13];
        labelB.textColor = [UIColor grayColor];
        labelB.text = _model.labelLoction;
        [view addSubview:labelB];
        
        self.tableView.tableHeaderView = view;
    } else if (_headerTag == 1) {
        // 老师
        UIView *view = [[UIView alloc] init];
        UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aaa:)];
        [view addGestureRecognizer:tapGesture];
        // 老师图片
        UIImageView *schoolImage = [[UIImageView alloc] initWithFrame:CGRectMake(14, 16, 90, 90)];
        schoolImage.image = [UIImage imageNamed:_model.labelImage];
        [view addSubview:schoolImage];
        
        // 老师名字
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(110, 16, kScreenW / 3, 16)];
        labelName.text = _model.labelTitle;
        [view addSubview:labelName];
        
        // 老师教授科目
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, kScreenW / 3, 12)];
        label1.font = [UIFont systemFontOfSize:13];
        label1.textColor = [UIColor grayColor];
        NSString *str1 = [NSString stringWithFormat:@"教授科目: %@", _model.labelClass1];
        label1.text = str1;
        [view addSubview:label1];
        
        // 老师教授年级
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(110, 50, kScreenW - 120, 12)];
        label2.font = [UIFont systemFontOfSize:13];
        label2.textColor = [UIColor grayColor];
        NSString *str2 = [NSString stringWithFormat:@"教授年级: %@", _model.labelClass2];
        label2.text = str2;
        [view addSubview:label2];
        
        // 老师教授风格
        NSString *str3 = [NSString stringWithFormat:@"教授风格: %@", _model.labelClass3];
        CGSize size = CGSizeMake(kScreenW - 120, 1000);
        CGSize msgSie = [str3 sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size];
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(110, 65, kScreenW - 120, msgSie.height)];
        label3.numberOfLines = 0;
        label3.font = [UIFont systemFontOfSize:13];
        label3.textColor = [UIColor grayColor];
        label3.text = str3;
        [view addSubview:label3];
        
        // 老师教学标签
        RYTeacherTool *tools = [[RYTeacherTool alloc] initWithFrame:CGRectMake(110, 70 + msgSie.height, kScreenW - 120, 12)];
        tools.label.text = _model.labelTag;
        [view addSubview:tools];
        
        view.frame = CGRectMake(0, 0, kScreenW, 95 + msgSie.height);
        
        self.tableView.tableHeaderView = view;
    } else {
        // 专家
        UIView *view = [[UIView alloc] init];
        UITapGestureRecognizer*tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(Actiondo:)];
        [view addGestureRecognizer:tapGesture];
        // 专家图片
        UIImageView *schoolImage = [[UIImageView alloc] initWithFrame:CGRectMake(14, 16, 90, 90)];
        schoolImage.image = [UIImage imageNamed:_model.labelImage];
        [view addSubview:schoolImage];
        
        // 专家名字
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(110, 16, kScreenW / 3, 16)];
        labelName.text = _model.labelTitle;
        [view addSubview:labelName];
        
        // 专家擅长领域
        NSString *str1 = [NSString stringWithFormat:@"擅长领域: %@", _model.labelClass1];
        CGSize size = CGSizeMake(kScreenW - 120, 1000);
        CGSize msgSie = [str1 sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(110, 35, kScreenW - 120, msgSie.height)];
        label1.numberOfLines = 0;
        label1.font = [UIFont systemFontOfSize:13];
        label1.textColor = [UIColor grayColor];
        label1.text = str1;
        [view addSubview:label1];
        
        // 专家咨询风格
        NSString *str2 = [NSString stringWithFormat:@"咨询风格: %@", _model.labelClass2];
        CGSize size2 = CGSizeMake(kScreenW - 120, 1000);
        CGSize msgSie2 = [str2 sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size2];
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(110, 40 + msgSie.height, kScreenW - 120, msgSie2.height)];
        label2.numberOfLines = 0;
        label2.font = [UIFont systemFontOfSize:13];
        label2.textColor = [UIColor grayColor];
        label2.text = str2;
        [view addSubview:label2];
        
        // 老师教学标签
        RYTeacherTool *tools = [[RYTeacherTool alloc] initWithFrame:CGRectMake(110, 45 + msgSie.height + msgSie2.height, kScreenW - 120, 12)];
        tools.label.text = _model.labelTag;
        [view addSubview:tools];
        
        view.frame = CGRectMake(0, 0, kScreenW, 70 + msgSie.height + msgSie2.height);
        self.tableView.tableHeaderView = view;
    }
   
}

#pragma mark -
#pragma mark UITableView的代理方法和实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else {
        return dateArray.count;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *array = [NSArray arrayWithObjects:@"简介", @"留言", nil];
    return [array objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 当section等于0时,根据简介的文本多少来改变row的高度
    if (indexPath.section == 0) {
        if (_rowState == YES) {
            // 根据字符串的多少来改变row的高度
            NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0f], NSFontAttributeName, nil];
            CGRect rect = [_model.labelContent boundingRectWithSize:CGSizeMake(kScreenW - 20, 1000) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dic context:nil];
            CGFloat height = rect.size.height;
            return height + 25;
        } else {
            // 当字符串不展开时返回固定高度65
            return 65;
        }
    } else {
        // 当section等于1时,根据留言的文本多少来改变row的高度
        RYPublicModel *model = [dateArray objectAtIndex:indexPath.row];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:13.0f], NSFontAttributeName, nil];
        CGRect rect = [model.strContent boundingRectWithSize:CGSizeMake(kScreenW - 80, 100) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dic context:nil];
        CGFloat height = rect.size.height;
        
        return height + 48;
    }
}
#pragma mark -
#pragma mark 实现RYPublicTableViewCell1的协议
- (void)changeHeightForRow:(BOOL)rowState
{
    _rowState = rowState;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        RYPublicTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell1"];
        cell.delegate = self;
        if (!cell) {
            cell = [[RYPublicTableViewCell1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell1"];
        }
        // 简介
        cell.labelStr.text = _model.labelContent;
        return cell;
        
    } else {
        RYPublicTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell2"];
        if (!cell) {
            cell = [[RYPublicTableViewCell2 alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TableViewCell2"];
        }
        // 留言
        RYPublicModel *model = [dateArray objectAtIndex:indexPath.row];
        cell.labelName.text = model.strName;
        cell.imageLag.image = [UIImage imageNamed:model.strImage];
        cell.labelTime.text = model.strTime;
        cell.labelContent.text = model.strContent;
        return cell;
    }
}

- (void)aaa:(UITapGestureRecognizer *)sender
{
    NSArray *arr = [NSArray arrayWithObjects:@"http://weibo.com/u/2746952711", @"http://blog.sina.com.cn/s/blog_525b72770100azso.html", @"http://blog.sina.com.cn/s/blog_5314ba390100ofvq.html", @"http://blog.sina.com.cn/s/blog_4bb32f7f010007g3.html", nil];
    DemoViewController *demo = [[DemoViewController alloc] init];
    demo.urlName = [arr objectAtIndex:_section];
    [self.navigationController pushViewController:demo animated:YES];
}

- (void)Actiondo:(UITapGestureRecognizer *)sender
{
    NSArray *arr = [NSArray arrayWithObjects:@"http://blog.sina.com.cn/lizixun", @"http://weibo.com/baiyanyi", @"http://t.hexun.com/sfwcd/default.html", nil];
    DemoViewController *demo = [[DemoViewController alloc] init];
    demo.urlName = [arr objectAtIndex:_tag];
    [self.navigationController pushViewController:demo animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


// 留言的假数据
- (void)dates
{
    dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"strName":@"安安",
                           @"strContent":@"老师人很好,对待学生很有耐心",
                           @"strTime":@"07-13 09:51",
                           @"strImage":@"head_portrait_a",
                           };
    NSDictionary *dict1 = @{
                            @"strName":@"喵星美呆",
                            @"strContent":@"上课氛围很好,是个不错的老师",
                            @"strTime":@"07-22 18:34",
                            @"strImage":@"head_portrait_b",
                            };
    NSDictionary *dict2 = @{
                            @"strName":@"小普恋恋520",
                            @"strContent":@"老师讲课很好,简明易懂,我们几个小伙伴都特别喜欢听这个老师的课,在课上可以学到很多东西,在课上有不懂的地方老师会反复的给我们讲,直到我们都明白了.老师有时候为了我们,连自己的身体都不好好照顾,带病来给我们上课,老师,我们爱你❤️❤️❤️",
                            @"strTime":@"08-3 06:41",
                            @"strImage":@"head_portrait_c",
                            };
    NSDictionary *dict3 = @{
                            @"strName":@"Luckgirl",
                            @"strContent":@"老师很不错哦",
                            @"strTime":@"08-23 07:33",
                            @"strImage":@"head_portrait_d",
                            };
    NSDictionary *dict4 = @{
                            @"strName":@"Hey Boy",
                            @"strContent":@"哎呦! 不错哦",
                            @"strTime":@"09-2 12:41",
                            @"strImage":@"head_portrait_e",
                            };
    NSDictionary *dict5 = @{
                            @"strName":@"小君君",
                            @"strContent":@"老师讲课很好,简明易懂",
                            @"strTime":@"09-3 14:24",
                            @"strImage":@"head_portrait_f",
                            };
    NSDictionary *dict6 = @{
                            @"strName":@"小胖子",
                            @"strContent":@"我很喜欢这个老师的课",
                            @"strTime":@"09-10 16:04",
                            @"strImage":@"head_portrait_g",
                            };
    NSDictionary *dict7 = @{
                            @"strName":@"我叫Hello",
                            @"strContent":@"课很好,就看自己学得咋样啦",
                            @"strTime":@"09-13 08:55",
                            @"strImage":@"head_portrait_h",
                            };
    NSDictionary *dict8 = @{
                            @"strName":@"全国物流",
                            @"strContent":@"老师的课很不错,赞一个",
                            @"strTime":@"09-22 12:43",
                            @"strImage":@"head_portrait_i",
                            };
    NSDictionary *dict9 = @{
                            @"strName":@"我爱你",
                            @"strContent":@"真不愧不特级教师,讲课的感觉就是不一样,就是好",
                            @"strTime":@"10-23 09:10",
                            @"strImage":@"head_portrait_j",
                            };

    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    [tempArr addObject:dict3];
    [tempArr addObject:dict4];
    [tempArr addObject:dict5];
    [tempArr addObject:dict6];
    [tempArr addObject:dict7];
    [tempArr addObject:dict8];
    [tempArr addObject:dict9];
    
    
    for (NSDictionary *dict in tempArr) {
        RYPublicModel *bookModel = [[RYPublicModel alloc] init];
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
