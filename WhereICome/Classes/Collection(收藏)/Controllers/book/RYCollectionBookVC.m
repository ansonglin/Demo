//
//  RYCollectionBookVC.m
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCollectionBookVC.h"
#import "RYCollectionBookTVCell.h"
#import "RYBookModel.h"
#import "RYBookDetailVC.h"

#define HEIGHTFORROW 111

@interface RYCollectionBookVC ()<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *dateArray;
}

@end

@implementation RYCollectionBookVC

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
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self.tableView registerClass:[RYCollectionBookTVCell class] forCellReuseIdentifier:@"bookcell"];
    
    self.navigationItem.title = _value;
    
    [self datas];
    
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
    RYCollectionBookTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bookcell"];
    if (!cell) {
        cell = [[RYCollectionBookTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bookcell"];
    }
    
    RYBookModel *model = [dateArray objectAtIndex:indexPath.row];
    
    cell.ImageView.image = [UIImage imageNamed:model.labelImage];
    cell.labelName.text = model.labelTitle;
    cell.labelContent.text = model.labelContent;
    cell.labelTool.labelTitle.text = model.labelTag;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYBookDetailVC *detail = [[RYBookDetailVC alloc] init];
    RYBookModel *model = [dateArray objectAtIndex:indexPath.row];
    detail.model = model;
    [self.navigationController pushViewController:detail animated:YES];
}

// 加载测试数据
- (void)datas
{
    dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                            @"labelTitle":@"吹牛大王历险记",
                            @"labelContent":@"大家都不喜欢吹牛的人,可凡事总有意外,有一个吹牛大王就备受欢迎.你要问什么,我只能回答你,他吹牛吹得是在太有水平啦!都吹出了厚厚一本书,吹出了大名气了.就连革命导师马克思写给恩格斯的信中,都曾借用他的名字来形容一个资产阶级的小文人, 说这个人撒谎真是个闵希豪生.\n对!这个吹牛大王就是闵希豪生男伯爵,他吹牛到了什么地步,让我简单的来说几个吧:",
                            @"labelTag":@"教育 冒险 励志 成长",
                            @"labelName":@"[德] 威廉姆斯",
                            @"labelLoction":@"",
                            @"labelImage":@"collection_book_pic_a",
                            };
    NSDictionary *dict1 = @{
                            @"labelTitle":@"拔萝卜-贝瓦儿歌集",
                            @"labelContent":@"贝瓦儿歌集儿童歌谣、经典儿歌、三字经、古诗为一体的儿歌汇合，具有动画精美、节奏欢快、语言简单、易学易懂等特点，深受广大小朋友和家长的喜爱。",
                            @"labelTag":@"教育 冒险 励志 成长",
                            @"labelName":@"张德",
                            @"labelLoction":@"",
                            @"labelImage":@"collection_book_pic_b",
                            };
    NSDictionary *dict2 = @{
                            @"labelTitle":@"小美人鱼",
                            @"labelContent":@"本书是迪士尼《小美人鱼》电影系列的第三部,故事回到爱丽儿还在大海中生活的情景,所以爱莉儿依然是人鱼姿态在故事中出现.本片中也会首度揭露爱丽儿的母亲雅典娜女王.自从雅典娜在一次意外中丧生后,川顿国王就下令:亚特兰帝卡不准有音乐存在!但年轻又热爱音乐的爱莉儿却对此令相当的反感,也决定不顾父亲的感受,就是要与音乐为伍!此举会为她带来哪些灾难?还是她可以因此找回父亲昔日对他们的关爱呢?",
                            @"labelName":@"[美] 拉斯",
                            @"labelTag":@"教育 励志 成长",
                            @"labelLoction":@"",
                        @"labelImage":@"collection_book_pic_c",
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
