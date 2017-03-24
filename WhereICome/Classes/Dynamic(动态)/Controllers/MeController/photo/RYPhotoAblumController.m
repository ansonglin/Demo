//
//  RYPhotoAblumController.m
//  WhereICome
//
//  Created by mkq on 15/6/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPhotoAblumController.h"
#import "RYPhotoDetailController.h"

//图片之间的距离
#define kImageMargin    10

//每行图片的数目
#define kImageCountInRow    2

//每个图片的大小
#define kImageW (kScreenW - (kImageCountInRow + 1) * kImageMargin) / kImageCountInRow
#define kimageH kImageW

@interface RYPhotoAblumController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>

@property (weak ,nonatomic)UICollectionView *collectionView;
/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation RYPhotoAblumController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建CollectionView
    [self setupCollectionView];
    //配置导航栏
    [self configNav];
    
    [self createView];
}

// 相册设置视图
- (void)createView
{
    self.cameraButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_cameraButton setBackgroundImage:[UIImage imageNamed:@"photo_camera"] forState:UIControlStateNormal];
    _cameraButton.frame = CGRectMake(0, 0, kScreenW / 3, 80);
    _cameraButton.hidden = YES;
    [self.view addSubview:_cameraButton];
    
    self.subjectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_subjectButton setBackgroundImage:[UIImage imageNamed:@"photo_subject"] forState:UIControlStateNormal];
    _subjectButton.frame = CGRectMake(kScreenW / 3, 0, kScreenW / 3, 80);
    _subjectButton.hidden = YES;
    [self.view addSubview:_subjectButton];
    
    self.manageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_manageButton setBackgroundImage:[UIImage imageNamed:@"photo_manage"] forState:UIControlStateNormal];
    _manageButton.frame = CGRectMake(kScreenW / 3 * 2, 0, kScreenW / 3, 80);
    _manageButton.hidden = YES;
    [self.view addSubview:_manageButton];
}

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLy = [[UICollectionViewFlowLayout alloc] init];
    
    flowLy.itemSize = CGSizeMake(kImageW, kimageH);
    flowLy.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    flowLy.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    UICollectionView *collView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLy];
    [self.view addSubview:collView];
    self.collectionView = collView;
    
    [collView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"photoAbulmItem"];
    collView.backgroundColor = [UIColor whiteColor];
    collView.showsHorizontalScrollIndicator = NO;
    collView.showsVerticalScrollIndicator = NO;
    collView.delegate = self;
    collView.dataSource = self;
}

#pragma mark   UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoAbulmItem" forIndexPath:indexPath];
    NSString *imageName = [self.datas objectAtIndex:indexPath.item];
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    item.backgroundColor = [UIColor redColor];
    imgView.frame = item.bounds;
    
    [item.contentView addSubview:imgView];
    
    // 添加手势删除相册
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handlelongpress:)];
    [item addGestureRecognizer:longPressGesture];
    longPressGesture.minimumPressDuration = 1.0;
    longPressGesture.delegate = self;
    longPressGesture.view.tag = indexPath.item;
    return item;
}

- (void)handlelongpress:(UILongPressGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始长按");
        NSLog(@"%ld", sender.view.tag);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(-9, -9, 25, 25);
        [button setBackgroundImage:[UIImage imageNamed:@"photo_delete"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = 13.5;
        button.tag = sender.view.tag;
        [sender.view addSubview:button];
        
#pragma mark 给选中的相册添加晃动事件
        srand([[NSDate date] timeIntervalSince1970]);
        float rand = (float)random();
        CFTimeInterval time = rand*0.0000000001;
        [UIView animateWithDuration:0.1 delay:time options:0  animations:^ {
             sender.view.transform = CGAffineTransformMakeRotation(-0.03);
         } completion:^(BOOL finished) {
             [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction  animations:^ {
                  sender.view.transform = CGAffineTransformMakeRotation(0.03);
              } completion:^(BOOL finished) {
              }];
         }];
    } else if (sender.state == UIGestureRecognizerStateEnded){
        NSLog(@"结束长按");
    }
}

- (void)deleteAction:(UIButton *)sender
{
    NSLog(@"%ld", sender.tag);
    [_datas removeObjectAtIndex:sender.tag];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:sender.tag inSection:0];
    NSArray *array = @[indexpath];
    [self.collectionView deleteItemsAtIndexPaths:array];
    [self.collectionView reloadData];
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RYPhotoDetailController *detail = [[RYPhotoDetailController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];

    RYLog(@"%@",[collectionView cellForItemAtIndexPath:indexPath]);
}

#pragma mark 懒加载

- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray arrayWithObjects:
                                @"dynamic_picture_a.jpg", @"dynamic_picture_b.jpg", @"dynamic_picture_c.jpg", @"dynamic_picture_d.jpg", nil];;
        
    }
    return _datas;
}

/**
 *  配置导航栏
 */
- (void)configNav
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"return_black"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.title = @"相册";
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *rightbtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *imageRight = [UIImage imageNamed:@"photo_right"];
    [rightbtn setImage:imageRight forState:(UIControlStateNormal)];
    [rightbtn addTarget:self action:@selector(rightButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    rightbtn.frame = CGRectMake(kScreenW - 40, 0, 30, 44);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightbtn];
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 控制设置栏的弹出与消失
- (void)rightButtonAction
{
    if (_manageButton.hidden == YES) {
        self.subjectButton.hidden = NO;
        self.manageButton.hidden = NO;
        self.cameraButton.hidden = NO;
    } else {
        self.subjectButton.hidden = YES;
        self.manageButton.hidden = YES;
        self.cameraButton.hidden = YES;
    }
}

@end
