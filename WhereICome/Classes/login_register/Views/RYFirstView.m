//
//  RYFirstView.m
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYFirstView.h"

@implementation RYFirstView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _scrollView.delegate = delegate;
        [_scrollView setContentSize:CGSizeMake(3 * kScreenW, 0)];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setBounces:NO];
        [self addSubview:_scrollView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenW / 3, kScreenH - 80, kScreenW / 3, 20)];
        _pageControl.numberOfPages = 3;
        [_pageControl.layer setCornerRadius:8];
        [self addSubview:_pageControl];

        // 引导页标题
//        self.imageTitle = [[UIImageView alloc] init];
//        _imageTitle.image = [UIImage imageNamed:@"first_baby_grow"];
//        [self addSubview:_imageTitle];
        // 登录按钮
        self.buttonLogin = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
        [_buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonLogin.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
        _buttonLogin.titleLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_buttonLogin];
        // 注册按钮
        self.buttonRegister = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonRegister setTitle:@"注册" forState:UIControlStateNormal];
        [_buttonRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _buttonRegister.backgroundColor = [UIColor colorWithRed:221 / 255.0 green:221 / 255.0 blue:221 / 255.0 alpha:1];
        _buttonRegister.titleLabel.font = [UIFont systemFontOfSize:22];
        [self addSubview:_buttonRegister];
        
        
        
        [self createImageView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
//    self.imageLogo.frame = CGRectMake(kScreenW * 0.16, kScreenH * 0.37, kScreenW * 0.68, 36);
    
//    self.imageTitle.frame = CGRectMake(kScreenW * 0.253, kScreenH * 0.37 + 76, kScreenW * 0.494, 30);
    
    self.buttonRegister.frame = CGRectMake(0, kScreenH - 50, kScreenW / 2, 50);
    
    self.buttonLogin.frame = CGRectMake(kScreenW / 2, kScreenH - 50, kScreenW / 2, 50);
}

- (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color typeface:(CGFloat)typeface
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(kScreenW / 2, kScreenH - 50, kScreenW / 2, 50);;
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:typeface];
    [button setTitleColor:color forState:UIControlStateNormal];
    return button;
}



#pragma  添加五张背景图片
- (void)createImageView
{
    NSArray *imageArray = [NSArray arrayWithObjects:@"first_pic_a", @"first_pic_b", @"first_pic_c", nil];
//    NSArray *arr = [NSArray arrayWithObjects:@"first_baby_grow", @"first_baby_education", @"first_baby_future", nil];
    for (int i = 0; i < imageArray.count; i++) {
        NSString *imageName = [imageArray objectAtIndex:i];
        UIImageView *image = [self createImageViewWithFrme:i Image:imageName];
        
        // 添加一个view
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(kScreenW * i, 0, kScreenW, kScreenH - 50)];
        view.backgroundColor = [UIColor grayColor];
        view.alpha = 0.48;
        
        // 引导页logo
//        self.imageLogo = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW * 0.16 + kScreenW * i, kScreenH * 0.37, kScreenW * 0.68, 36)];
//        _imageLogo.image = [UIImage imageNamed:@"whereicome"];
        // 引导页标题
//        self.imageTitle = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW * 0.253 + kScreenW * i, kScreenH * 0.37 + 76, kScreenW * 0.494, 30)];
//        _imageTitle.image = [UIImage imageNamed:[arr objectAtIndex:i]];
        [_scrollView addSubview:image];
        [_scrollView addSubview:view];
//        [_scrollView addSubview:_imageLogo];
//        [_scrollView addSubview:_imageTitle];
    }
}
- (UIImageView *)createImageViewWithFrme:(NSInteger)integer   Image:(NSString *)imageStr
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW * integer, 0, kScreenW, kScreenH - 50)];
    imageView.image = [UIImage imageNamed:imageStr];
    return imageView;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
