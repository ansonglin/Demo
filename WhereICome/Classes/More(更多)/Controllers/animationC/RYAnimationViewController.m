//
//  RYAnimationViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAnimationViewController.h"

@interface RYAnimationViewController ()

@end

@implementation RYAnimationViewController
@synthesize movieUrl;

- (void)dealloc
{
    
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 设置屏幕颜色为黑色
        self.view.backgroundColor = [UIColor blackColor];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createActivity];
}

- (void)createActivity
{
    loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140, 150, 120, 140)];
    loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [self.view addSubview:loading];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(130, 190, 120, 140)];
    label.text = @"加载中......请耐心等候";
    [label setNumberOfLines:0];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [loading startAnimating];
    [self.view addSubview:label];
}

- (void)moviePlayerLoadStateChange:(NSNotification *)notification
{
    [loading stopAnimating];
    if ([mp loadState] != MPMovieLoadStateUnknown)
    {
        // Remove observer
        [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
        //设置横屏
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [[self view] setBounds:CGRectMake(0, 0, kScreenH, kScreenW)];
        [[self view] setCenter:CGPointMake(kScreenW / 2, kScreenH / 2)];
        //选中当前view
        [[self view] setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
        [[mp view] setFrame:CGRectMake(0, 0, kScreenH, kScreenW)];
        [self.view addSubview:[mp view]];
        [mp play];
    }
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)readyPlayer
{
    mp = [[MPMoviePlayerController alloc] initWithContentURL:movieUrl];
    //loadState 是readonly 属性检测播放状态
    if ([mp respondsToSelector:@selector(loadState)])
    {
        // Set movie player layout
        [mp setControlStyle:MPMovieControlStyleFullscreen];        //MPMovieControlStyleFullscreen        //MPMovieControlStyleEmbedded
        // 满屏
        [mp setFullscreen:YES];
        // 有助于减少延迟
        [mp prepareToPlay];
        // Register that the load state changed (movie is ready)
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerLoadStateChange:) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    } else {
        // Play the movie For 3.1.x devices
        [mp play];
    }
    // Register to receive a notification when the movie has finished playing.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
    //UIStatusBarStyleDefault = 0 黑色文字，浅色背景时使用
    //UIStatusBarStyleLightContent = 1 白色文字，深色背景时使用
}

- (BOOL)prefersStatusBarHidden
{
    return YES; // 返回NO表示要显示，返回YES将hiden
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
