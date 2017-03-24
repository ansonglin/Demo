//
//  RYAnimationListVC.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAnimationListVC.h"
#import "RYAnimationListView.h"
#import "RYAnimationListTVCell.h"
#import "RYSearchViewController.h"
#import "RYAnimationDetailVC.h"

#import "RYAnimationViewController.h"

#import "RYListModel.h"
#import "RYMoreListViewController.h"
#import "DemoViewController.h"

#define HEIGHTFORROW (kScreenH - 64) / 3

@interface RYAnimationListVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *array;

// 测试视频的数组
@property (nonatomic, strong) NSArray *mediaArray;

@end

@implementation RYAnimationListVC


- (void)dealloc
{
    self.myView.tableView.delegate = nil;
    self.myView.tableView.dataSource = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
//        self.array = [NSMutableArray arrayWithObjects:@"推荐动画", @"经典动画", @"宝宝最爱", nil];
#pragma mark 测试视频数据
        self.mediaArray = [NSArray arrayWithObjects:@"http://vr.tudou.com/v2proxy/v2.m3u8?it=100816164", @"http://pl.youku.com/playlist/m3u8?ts=1407642730&keyframe=0&vid=XMjMyOTk3NDAw&type=flv&ep=eyaUHU%2BJVMkD5SHbiD8bYn3mdn9eXJZ3rGLM%2FrY5A8VQOa%2FQnjbYxw%3D%3D&sid=9407642730240125a428a&token=7890&ctype=12&ev=1&oip=3663591661", @"http://pl.youku.com/playlist/m3u8?ts=1407641344&keyframe=0&vid=XMTgyNTQzNTAw&type=mp4&ep=eiaUHU%2BJV80E4SXajT8bYy%2FhdCNbXJZ3kkjM%2F7YDSsVAOa%2FQnjrVwg%3D%3D&sid=8407641344655124330dd&token=7445&ctype=12&ev=1&oip=3663591661",nil];
    }
    return self;
}

// 创建视图
- (void)loadView
{
    self.myView = [[RYAnimationListView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_state == 0) {
        [self createGameData];
    } else if (_state == 4) {
        [self createToyData];
    } else {
        [self createAnimationData];
    }
    
#pragma mark 创建搜索按钮
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.frame = CGRectMake(kScreenW - 40, 20, 20, 20);
    [searchButton addTarget:self action:@selector(searchBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setBackgroundImage:[UIImage imageNamed:@"animation_search"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchButton];
    
    
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


- (void)searchBtnAction:(UIButton *)sender
{
    RYSearchViewController *searchView = [[RYSearchViewController alloc] init];
    [self.navigationController pushViewController:searchView animated:YES];
}

#pragma mark UITableView的代理方法和实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHTFORROW;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strID= @"animation";
    RYAnimationListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (!cell) {
        cell = [[RYAnimationListTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    RYListModel *model = [self.array  objectAtIndex:indexPath.row];
    cell.titleLabel.text = model.title;
    [cell.button setTitle:model.btnTitle forState:UIControlStateNormal];
    cell.button.tag = indexPath.row;
    [cell.button addTarget:self action:@selector(moreButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *imageArr = [NSArray arrayWithArray:(NSArray *)model.btnImage];
    NSArray *titleArr = [NSArray arrayWithArray:(NSArray *)model.moreTitle];
    cell.buttonOne.imageBtn.image = [UIImage imageNamed:[imageArr firstObject ]];
    cell.buttonOne.labelBtn.text = [titleArr firstObject];
    
    cell.buttonTwo.imageBtn.image = [UIImage imageNamed:[imageArr objectAtIndex:1]];
    cell.buttonTwo.labelBtn.text = [titleArr objectAtIndex:1];
    
    cell.buttonThree.imageBtn.image = [UIImage imageNamed:[imageArr lastObject]];
    cell.buttonThree.labelBtn.text = [titleArr lastObject];
    
    [cell.buttonOne addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonTwo addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonThree addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{   // 取消UITabelViewCell选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RYMoreListViewController *moreList = [[RYMoreListViewController alloc] init];
    RYListModel *model = [self.array  objectAtIndex:indexPath.row];
    moreList.moreTitle = model.title;
    [self.navigationController pushViewController:moreList animated:YES];
}

- (void)moreButtonAction:(UIButton *)sender
{
    RYMoreListViewController *moreList = [[RYMoreListViewController alloc] init];
    RYListModel *model = [self.array  objectAtIndex:sender.tag];
    moreList.moreTitle = model.title;
    [self.navigationController pushViewController:moreList animated:YES];
}

- (void)buttonAction:(UIButton *)sender
{
    if (_state == 7) {
        RYAnimationDetailVC *animationView = [[RYAnimationDetailVC alloc] init];
        RYAnimationViewController *a = [[RYAnimationViewController alloc] init];
        NSString *strUrl = [self.mediaArray objectAtIndex:sender.tag - 1000];
        animationView.url = strUrl;
        a.movieUrl = [NSURL URLWithString:strUrl];
        [a readyPlayer];
        [self presentViewController:a animated:YES completion:nil];
    } else if (_state == 0) {
        DemoViewController *demo = [[DemoViewController alloc] init];
        NSArray *array = [NSArray arrayWithObjects:@"http://www.appchina.com/app/com.iok.childwordhan/", @"http://game.3533.com/game/33709/", @"http://www.duote.com/android/91829.html", nil];
        demo.urlName = [array objectAtIndex:sender.tag - 1000];
        [self.navigationController pushViewController:demo animated:YES];
    }
}

// 动画片数据
- (void)createAnimationData
{
    self.array = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"title":@"推荐动画",
                           @"moreTitle":@[@"大耳朵图图",
                                          @"海尔兄弟",
                                          @"熊出没",
                                          ],
                           @"btnTitle":@"更多>",
                           @"btnImage":@[@"animation_cell3",
                                         @"animation_cell1",
                                         @"animation_cell2",
                                        ],
                           @"content":@"这是一个机灵，淘气，聪明的小孩，名叫胡图图，剧中三岁。他天生快乐，心地善良，喜欢多管闲事，精力充沛，所有可爱的小朋友都能从图图身上找到自己成长的影子，对周围的事物非常好奇，并且还有自己独特的见解和超强想象力，他的言行常常让人大跌眼镜。有时让妈妈尴尬不已，有时却给了妈妈太多的惊喜，而把图图培养成一个真正的男子汉是爸爸最伟大的心愿。孩子从无知到有知，是一个漫长而琐碎的学习，探索过程，对每一位父母来说，都会经历其中的喜悦和烦恼，当今的独生子女家庭，在孩子成长，教育的问题上更是面临着很多难题，因此我们选择平凡小孩胡图图的一家作为故事的载体，讲述孩子在成长过程中一个个有趣的小故事，以引起观众的共鸣。",
                           
                           };
    NSDictionary *dict1 = @{
                            @"title":@"经典动画",
                            @"moreTitle":@[@"龙猫",
                                           @"黑猫警长",
                                           @"海底小纵队",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"animation_cell4",
                                          @"animation_cell5",
                                          @"animation_cell6",
                                          ],
                            @"content":@"被智慧老人制造出来的海尔兄弟，即哥哥琴岛与弟弟海尔，和他们的小伙伴一起旅行冒险。从太平洋跨越到美洲、南极，又从澳洲来到非洲、欧洲，亚洲，最后回到起点。一路上饱览风景名胜的同时，也遇到各种各样的危险，身处不同的险境，在这当中亲身体验自然的神秘与美丽，了解它们背后的故事。可谓融地理、人文、历史等知识于一体。",
                            };
    NSDictionary *dict2 = @{
                            @"title":@"宝宝最爱",
                            @"moreTitle":@[@"懒羊羊外传",
                                           @"葫芦娃",
                                           @"爱探险的朵拉",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"animation_cell7",
                                          @"animation_cell8",
                                          @"animation_cell9",
                                          ],
                            @"content":@"奸诈狡猾的光头强是一个伐木队的小老板，他带着老板的重托来到风景优美的东北原始森林里采伐原木，却不料平静的森林中原来隐藏着两个可怕的对手——森林的主人熊兄弟！看着森林被毁，熊兄弟决定要保护森林，保护家园，驱逐所有的破坏者！但是奸诈狡猾的光头强可没那么容易就离开。于是，一场旷日持久的家园保卫战开始了……... ",
                            };
    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    
    for (NSDictionary *dict in tempArr) {
        RYListModel *bookModel = [[RYListModel alloc] init];
        [bookModel setValuesForKeysWithDictionary:dict];
        [_array addObject:bookModel];
    }
}

// 游戏数据
- (void)createGameData
{
    self.array = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"title":@"推荐游戏",
                           @"moreTitle":@[@"学汉字",
                                          @"跑跑小汽车",
                                          @"学英语",
                                          ],
                           @"btnTitle":@"更多>",
                           @"btnImage":@[@"more_game_pic_a",
                                         @"more_game_pic_b",
                                         @"more_game_pic_c",
                                         ],
                           };
    NSDictionary *dict1 = @{
                            @"title":@"经典游戏",
                            @"moreTitle":@[@"找水果",
                                           @"小象托尼",
                                           @"小猫画画",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"more_game_pic_d",
                                          @"more_game_pic_e",
                                          @"more_game_pic_f",
                                          ],
                            
                            };
    NSDictionary *dict2 = @{
                            @"title":@"宝宝最爱",
                            @"moreTitle":@[@"暴力摩托2",
                                           @"我爱做蛋糕",
                                           @"托马斯过河",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"more_game_pic_g",
                                          @"more_game_pic_h",
                                          @"more_game_pic_i",
                                          ],
                            
                            };
    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    
    for (NSDictionary *dict in tempArr) {
        RYListModel *bookModel = [[RYListModel alloc] init];
        [bookModel setValuesForKeysWithDictionary:dict];
        [_array addObject:bookModel];
    }
    
}
// 玩具数据
- (void)createToyData
{
    self.array = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSDictionary *dict = @{
                           @"title":@"推荐玩具",
                           @"moreTitle":@[@"花气球",
                                          @"滑梯",
                                          @"小兔子",
                                          ],
                           @"btnTitle":@"更多>",
                           @"btnImage":@[@"more_toy_pic_a",
                                         @"more_toy_pic_b",
                                         @"more_toy_pic_c",
                                         ],
                           
                           };
    NSDictionary *dict1 = @{
                            @"title":@"经典玩具",
                            @"moreTitle":@[@"乐高",
                                           @"培宝乐",
                                           @"智高",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"more_toy_pic_d",
                                          @"more_toy_pic_e",
                                          @"more_toy_pic_f",
                                          ],
                            
                            };
    NSDictionary *dict2 = @{
                            @"title":@"宝宝最爱",
                            @"moreTitle":@[@"银辉玩具",
                                           @"陀螺",
                                           @"小汽车",
                                           ],
                            @"btnTitle":@"更多>",
                            @"btnImage":@[@"more_toy_pic_g",
                                          @"more_toy_pic_h",
                                          @"more_toy_pic_i",
                                          ],
                            
                            };
    [tempArr addObject:dict];
    [tempArr addObject:dict1];
    [tempArr addObject:dict2];
    
    for (NSDictionary *dict in tempArr) {
        RYListModel *bookModel = [[RYListModel alloc] init];
        [bookModel setValuesForKeysWithDictionary:dict];
        [_array addObject:bookModel];
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
