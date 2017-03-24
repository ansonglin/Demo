//
//  RYPhotoDetailController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPhotoDetailController.h"
#import "SlideImageView.h"

@interface RYPhotoDetailController ()<SlideImageViewDelegate>

// 图片数组
@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) SlideImageView *sliderImage;


@end

@implementation RYPhotoDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    [self configNav];
    
    self.images = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", nil];

    [self createView];
}

- (void)createView
{
    // 设置slideImageView
    SlideImageView *tmpSlideImageView = [[SlideImageView alloc]initWithFrame:CGRectMake(20, 100, kScreenW - 80, kScreenH - 250) ZMarginValue:50 XMarginValue:10 AngleValue:0.3 Alpha:1000];
    tmpSlideImageView.delegate = self;
    [self.view addSubview:tmpSlideImageView];
    self.sliderImage = tmpSlideImageView;
    
    // 添加图片
    for (int i = 0; i < _images.count; i++) {
        NSString *tmpImage = [_images objectAtIndex:i];
        [self.sliderImage addImage:[UIImage imageNamed:tmpImage]];
    }
    [self.sliderImage reLoadUIview];
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
    self.title = @"宝宝";
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
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
