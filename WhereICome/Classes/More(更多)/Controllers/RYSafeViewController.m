

//
//  RYSafeViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYSafeViewController.h"



@interface RYSafeViewController ()

@end

@implementation RYSafeViewController



- (void)dealloc
{
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.hidesBottomBarWhenPushed = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];

    
    [self createView];
   
}


- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark 创建
- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, kScreenW, kScreenH - 40)];
    [self.view addSubview:_scrollView];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, kScreenW - 40, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = _titleA;
    titleLabel.font = [UIFont systemFontOfSize:23.0f];
    [_scrollView addSubview:titleLabel];
//    titleLabel.backgroundColor = [UIColor redColor];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, kScreenW - 40, kScreenH)];
    _label.text = _content;
    _label.numberOfLines = 0;
    [_label sizeToFit];
    _scrollView.contentSize = CGSizeMake(_label.frame.size.width, _label.frame.size.height + 100);
    [_scrollView sizeToFit];
    [_scrollView addSubview:_label];
    
    
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
