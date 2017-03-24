//
//  RYLoginController.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYLoginController.h"
#import "RYTabBarController.h"
#import "UIImage+resize.h"
#import "RYLoginScrollView.h"
#import "UIView+corner.h"
#import "RYRegisterController.h"
#import "RYAgreeMentController.h"
#import "RYPrivacyController.h"
#import "UIImage+GaussianBlur.h"
#define RYNewfeatureImageCount 3

// 4.是否为4inch
#define fourInch ([UIScreen mainScreen].bounds.size.height == 568)

@interface RYLoginController ()<UIScrollViewDelegate,RYLoginScrollViewDelegate>
/**
 *  指示器
 */
@property (nonatomic, weak) UIPageControl *pageControl;
/**
 *  滚动视图
 */
@property (nonatomic, weak)RYLoginScrollView *scrollView;
/**
 *  密码
 */
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
/**
 *  注册按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
/**
 *  帮助按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *helpBtn;
/**
 *  登陆按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

/**
 *  忘记密码
 */
@property (weak, nonatomic) IBOutlet UIButton *forgetPwd;
/**
 *  输入信息的背景视图
 */
@property (weak, nonatomic) IBOutlet UIView *midBgView;

@end

@implementation RYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加UISrollView
//    [self setupScrollView];
//
//    // 2.添加pageControl
//    [self setupPageControl];
    
    
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
//    image.image = [UIImage imageNamed:@"login_ground_pic"];
//    [self.view insertSubview:image atIndex:0];
//    
//    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    
//    self.view.backgroundColor = RYColorFromRGB(0X1ba7d0);
    // 3.配置子视图
    [self configLoginSubView];
}
- (void)configLoginSubView
{
    [self.userNameTextField setTextColor:[UIColor blackColor]];
    [self.pwdTextField setTextColor:[UIColor blackColor]];
    UIColor *tintColor = [UIColor whiteColor];//RYColorFromRGB(0X0b7025);
    NSInteger cornerValue = 3;
    [self.midBgView setUpViewCornerWidth:0 withBorderColor:nil withBorder:cornerValue];
    //登陆按钮
    [self.loginBtn setTitleColor:tintColor forState:(UIControlStateNormal)];
    [self.loginBtn setUpViewCornerWidth:0 withBorderColor:nil withBorder:cornerValue];
    //忘记密码
    [self.forgetPwd setTitleColor:tintColor forState:(UIControlStateNormal)];
    //注册
//    [self.registerBtn setTitleColor:tintColor forState:(UIControlStateNormal)];
    [self.registerBtn setUpViewCornerWidth:0 withBorderColor:nil withBorder:cornerValue];
    //帮助
//    [self.helpBtn setTitleColor:tintColor forState:(UIControlStateNormal)];
    [self.helpBtn setUpViewCornerWidth:0 withBorderColor:nil withBorder:cornerValue];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
//    [self.view insertSubview:self.scrollView atIndex:0];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    // 1.添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = RYNewfeatureImageCount;
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height - 30;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];//RYColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = RYColor(189, 189, 189);
    
}
//键盘事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.userNameTextField.isFirstResponder || self.pwdTextField.isFirstResponder) {
        [self.userNameTextField resignFirstResponder];
        [self.pwdTextField resignFirstResponder];
    }

    [super touchesBegan:touches withEvent:event];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    RYLoginScrollView *scrollView = [[RYLoginScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.loginViewDetegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
#pragma mark - 
#pragma mark 注册页面添加背景滑动图片
    // 2.添加图片
    CGFloat imageW = kScreenW;
    CGFloat imageH = kScreenH;
    NSArray *imageArray = [NSArray arrayWithObjects:@"login_ground_pic1", @"login_ground_pic2", @"login_ground_pic3", nil];
    for (int index = 0; index<RYNewfeatureImageCount; index++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        // 添加一个view
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageW, imageH)];
        view.backgroundColor = [UIColor lightGrayColor];
//        view.alpha = 0.8;
        [imageView addSubview:view];
        
        // 设置frame
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        // 设置图片
#pragma mark -
#pragma mark 不能使用一个拉伸过后的图片,否则在iPhone6 plus上会失真
        NSString *name = [imageArray objectAtIndex:index];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
    }
    
    // 3.设置滚动的内容尺寸
    scrollView.contentSize = CGSizeMake(imageW * RYNewfeatureImageCount, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

#pragma mark UIScrollViewDelegate
/**
 *  只要UIScrollView滚动了,就会调用
 *
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}
#pragma mark  RYLoginScrollViewDelegate
- (void)LoginScrollView:(RYLoginScrollView *)scrollView clicked:(UIEvent *)event
{
    [self.userNameTextField resignFirstResponder];
    [self.pwdTextField resignFirstResponder];
}

- (IBAction)registerBtnClick:(UIButton *)sender {
//    RYRegisterController *registerVc = [[RYRegisterController alloc] initWithNibName:@"RYRegisterController" bundle:nil];
//    RYPrivacyController *privacyVc = [[RYPrivacyController alloc] initWithNibName:@"RYPrivacyController" bundle:nil];
//    [self presentViewController:privacyVc animated:YES completion:nil];
    //键盘退出
    [self touchesBegan:nil withEvent:nil];
    RYAgreeMentController *agreement = [[RYAgreeMentController alloc] init];
    [self presentViewController:agreement animated:YES completion:nil];
    
}

- (IBAction)helpBtnClick:(UIButton *)sender {
//    RYAgreeMentController *agreement = [[RYAgreeMentController alloc] init];
//    
    //    [self presentViewController:agreement animated:YES completion:nil];
    //键盘退出
    [self touchesBegan:nil withEvent:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)loginBtnClick:(UIButton *)sender {

    // 显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    //登陆按钮不可点击
    sender.enabled = NO;
    //键盘退出
    [self touchesBegan:nil withEvent:nil];
    // 切换窗口的根控制器
    RYTabBarController *tabVar = [[RYTabBarController alloc] init];
    kKeyWindow.rootViewController = tabVar;
    tabVar.view.x = kScreenW;
    self.loginBtn.enabled = NO;
    
    [UIView animateWithDuration:0.3 animations:^{
         tabVar.view.x = 0;
    } completion:^(BOOL finished) {
        //关闭模态  不然会出现内存问题
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (IBAction)forgetBtnClick:(UIButton *)sender {
}

- (void)dealloc
{
    RYLog(@"login Vc dealloc");
}
@end
