//
//  RYIdolViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYIdolViewController.h"
#import "RYIdolCollectionViewCell.h"
#import "RYIdolFlowlayout.h"
#import "RYIdolDetailController.h"

@interface RYIdolViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

/** 所有的图片名 */
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *contentArray;


@end

@implementation RYIdolViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.contentArray = [NSMutableArray arrayWithObjects:@"小糯米,来自朋友圈.今年两岁六个月啦.宝宝很可爱,身边的朋友都很喜欢他.赶紧来认识他吧", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"偶像";
    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    // 创建布局
    RYIdolFlowlayout *layout = [[RYIdolFlowlayout alloc] init];
    // 创建collectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    [collectionView registerClass:[RYIdolCollectionViewCell class] forCellWithReuseIdentifier:@"RYIdolCollectionViewCell"];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 加载图片数据
- (NSMutableArray *)images
{
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        for (int i = 1; i<=18; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    return _images;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RYIdolCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RYIdolCollectionViewCell" forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    cell.label.text = [_contentArray firstObject];
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    // 删除图片名
    //    [self.images removeObjectAtIndex:indexPath.item];
    //    // 刷新数据
    //    //    [self.collectionView reloadData];
    //    // 直接将cell删除
    //    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
    RYIdolDetailController *idolPhoto = [[RYIdolDetailController alloc] init];
    idolPhoto.imageName = [_images objectAtIndex:indexPath.item];
    idolPhoto.imageArray = self.images;
    [self.navigationController pushViewController:idolPhoto animated:YES];
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
