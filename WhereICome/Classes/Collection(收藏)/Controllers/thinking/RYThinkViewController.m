//
//  RYThinkViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYThinkViewController.h"
#import "RYThinkingBtn.h"
#import "RYThinkDetailController.h"

@interface RYThinkViewController ()

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *titleArray;


@end

@implementation RYThinkViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.imageArray = [NSMutableArray arrayWithObjects:@"novel", @"music", @"message", @"study", @"talk", @"opera", @"radio", @"IT", @"other", @"hot", @"history", @"healthy", nil];
        self.titleArray = [NSMutableArray arrayWithObjects:@"成语寓言", @"睡前音乐", @"唐诗三百首", @" 宝宝学汉字", @"0~3岁折纸", @"宝宝识物", @"三字经", @"弟子规", @"世界童话", @"热门视频", @"小历史", @"小儿健康", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createButton];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createButton
{
    for (int i = 0; i < _imageArray.count; i++) {
        self.button = [RYThinkingBtn createBtnWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(10 + ((kScreenW - 40) / 3 + 10) * (i % 3), 64 + ((kScreenH - 40) / 6 + 30) * (i / 3), (kScreenW - 40) / 3, (kScreenH - 40) / 6 + 20);
        [_button setImage:[UIImage imageNamed:[_imageArray objectAtIndex:i]] forState:UIControlStateNormal];
        [_button setTitle:[_titleArray objectAtIndex:i] forState:UIControlStateNormal];
        _button.tag = 10000 + i;
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_button];
    }
}

- (void)buttonAction:(UIButton *)sender
{
    RYThinkDetailController *detail = [[RYThinkDetailController alloc] init];
    detail.titleName = [_titleArray objectAtIndex:sender.tag - 10000];
    [self.navigationController pushViewController:detail animated:YES];
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
