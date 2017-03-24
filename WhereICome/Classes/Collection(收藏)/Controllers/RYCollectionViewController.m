//
//  RYCollectionViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCollectionViewController.h"
#import "RYCollectionView.h"
#import "RYCollectionViewCell.h"
#import "CollectionReusableView.h"
#import "RYCollectionBookVC.h"
#import "RYActivityViewController.h"
#import "RYAnimationListVC.h"
#import "RYMusicViewController.h"
#import "RYClassViewController.h"
#import "RYPsychologyViewController.h"
#import "RYSchoolsViewController.h"
#import "RYIdolViewController.h"
#import "RYThinkViewController.h"

// UICollectionView的item宽度
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 42) / 3
#define ITEMS_HIGHT1 ([UIScreen mainScreen].bounds.size.height - 221 ) / 4
// 图片与title的数据

#define IMAGE @"collection_game", @"collection_classroom", @"collection_book", @"collection_thinking", @"collection_music", @"collection_toy", @"collection_school", @"collection_parent-child_activities", @"collection_idol", @"collection_animation", @"collection_psychological", @"collection_intelligence"

#define TITLE @"智力游戏", @"精品课堂", @"成长书籍", @"思维锻炼", @"天籁之音", @"喜爱玩具", @"梦想学府", @"亲子活动", @"我的偶像", @"我的动画", @"心理专家", @"智力开发"

@interface RYCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>


@end

@implementation RYCollectionViewController
/**
 *  代理置空
 */
- (void)dealloc
{
    self.myView.collectionView.delegate = nil;
    self.myView.collectionView.dataSource = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.imageArray = [NSArray arrayWithObjects:IMAGE, nil];
        self.titleArray = [NSArray arrayWithObjects:TITLE, nil];
    }
    return self;
}

/**
 *  创建视图
 */
- (void)loadView
{
    self.myView = [[RYCollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
   
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.myView.collectionView registerClass:[RYCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    // 注册header
//    [self.myView.collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];

}

#pragma mark UICollectionView的代理方法和实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(ITEMS_WIDTH1, ITEMS_HIGHT1);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    cell.title.text = [self.titleArray objectAtIndex:indexPath.item];
    cell.image.image = [UIImage imageNamed:[self.imageArray objectAtIndex:indexPath.item]];
    return cell;
}
#pragma mark 给UICollectionViewDataSource的代理方法
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    self.reusableView = nil;
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        self.reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
//    }
//    return self.reusableView;
//}
// cell点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 2) {
        RYCollectionBookVC *bookView = [[RYCollectionBookVC alloc] init];
        bookView.value = [self.titleArray objectAtIndex:indexPath.item];
        [self.navigationController pushViewController:bookView animated:YES];
    } else if (indexPath.item == 7) {
        RYActivityViewController *activity = [[RYActivityViewController alloc] init];
        [self.navigationController pushViewController:activity animated:YES];
    } else if (indexPath.item == 4) {
        RYMusicViewController *music = [[RYMusicViewController alloc] init];
        [self.navigationController pushViewController:music animated:YES];
    } else if (indexPath.item == 9) {
        RYAnimationListVC *animation = [[RYAnimationListVC alloc] init];
        animation.state = 7;
        [self.navigationController pushViewController:animation animated:YES];
    } else if (indexPath.item == 1) {
        RYClassViewController *class = [[RYClassViewController alloc] init];
        [self.navigationController pushViewController:class animated:YES];
    } else if (indexPath.item == 5) {
        RYAnimationListVC *animation = [[RYAnimationListVC alloc] init];
        animation.state = 4;
        [self.navigationController pushViewController:animation animated:YES];
    } else if (indexPath.item == 0) {
        RYAnimationListVC *animation = [[RYAnimationListVC alloc] init];
        animation.state = 0;
        [self.navigationController pushViewController:animation animated:YES];
    } else if (indexPath.item == 10) {
        RYPsychologyViewController *animation = [[RYPsychologyViewController alloc] init];
        [self.navigationController pushViewController:animation animated:YES];
    } else if (indexPath.item == 6) {
        RYSchoolsViewController *animation = [[RYSchoolsViewController alloc] init];
        [self.navigationController pushViewController:animation animated:YES];
    } else if (indexPath.item == 8) {
        RYIdolViewController *idol = [[RYIdolViewController alloc] init];
        [self.navigationController pushViewController:idol animated:YES];
    } else if (indexPath.item == 3) {
        RYThinkViewController *idol = [[RYThinkViewController alloc] init];
        [self.navigationController pushViewController:idol animated:YES];
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
