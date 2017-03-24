//
//  RYMusicViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMusicViewController.h"
#import "RYMusicPlayViewController.h"
#import "MusicModel.h"

@interface RYMusicViewController ()<UITableViewDataSource,UITableViewDelegate>


{
    NSMutableArray *musicArray;
    NSArray *array;
    NSArray *imageArray;
}

@end

@implementation RYMusicViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        array = [NSArray arrayWithObjects:@"<花样姐姐>主题曲", @"<何以笙箫默>主题曲", @"<左耳>主题曲", nil];
        imageArray = [NSArray arrayWithObjects:@"music_1", @"music_2", @"music_3", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initDate];
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

- (void)initDate
{
    musicArray = [NSMutableArray array];
    NSMutableArray *array1 = [NSMutableArray array];
    NSDictionary *dic = @{
                          @"musicID":@"0",
                          @"strUrl":@"http://fdfs.xmcdn.com/group15/M01/17/D0/wKgDaFVxHXGwlLXuABpSbYT5hd4729.mp3",
                          };
    NSDictionary *dic1 = @{
                           @"musicID":@"1",
                           @"strUrl":@"http://fdfs.xmcdn.com/group6/M06/4A/38/wKgDg1U0XGDwOt_4ACfGNzhajXw057.mp3",
                           };
    
    NSDictionary *dic2 = @{
                           @"musicID":@"2",
                           @"strUrl":@"http://fdfs.xmcdn.com/group6/M0B/27/91/wKgDg1Us40-RrOleABvnc44Mr70021.mp3",
                           };
    
    [array1 addObject:dic];
    [array1 addObject:dic1];
    [array1 addObject:dic2];
    for (NSDictionary *dict in array1) {
        MusicModel *model = [[MusicModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [musicArray addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return musicArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *strMusic = @"musicID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strMusic];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strMusic];
    }
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicModel *model = [musicArray objectAtIndex:indexPath.row];
    RYMusicPlayViewController *musicVC = [[RYMusicPlayViewController alloc] init];
    musicVC.musicArray = musicArray;
    musicVC.mid = model.musicID;
    musicVC.music = model;
    musicVC.imageName = [imageArray objectAtIndex:indexPath.row];
//    [self.navigationController pushViewController:musicVC animated:YES];
    [self presentViewController:musicVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryb
 oardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
