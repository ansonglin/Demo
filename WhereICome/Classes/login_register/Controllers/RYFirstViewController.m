
//
//  RYFirstViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYFirstViewController.h"
#import "RYLoginController.h"
#import "RYPrivacyController.h"

@interface RYFirstViewController ()<UIScrollViewDelegate>

@end

@implementation RYFirstViewController

- (void)loadView
{
    self.myView = [[RYFirstView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
    
    [self.myView.buttonLogin addTarget:self action:@selector(buttonLoginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.myView.buttonRegister addTarget:self action:@selector(buttonRegisterAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [UIApplication sharedApplication].statusBarHidden = YES;
    [self.myView insertSubview:self.myView.scrollView atIndex:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)buttonLoginAction
{
    RYLoginController *loginVC = [[RYLoginController alloc] initWithNibName:@"RYLoginController" bundle:nil];
    [self presentViewController:loginVC animated:YES completion:nil];
}
- (void)buttonRegisterAction
{
    RYPrivacyController *privacyVc = [[RYPrivacyController alloc] initWithNibName:@"RYPrivacyController" bundle:nil];
    [self presentViewController:privacyVc animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#warning 使pageControl按图片滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int page = self.myView.scrollView.contentOffset.x / kScreenW;
    self.myView.pageControl.currentPage = page;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    RYLog(@"first Vc dealloc");
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
