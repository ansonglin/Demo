//
//  RYToolBarPopView.m
//  WhereICome
//
//  Created by mkq on 15/5/29.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
#define kBtnPadding   2
#define kPopViewW   80
#define kPopViewH   120
#import "RYToolBarPopView.h"

@interface RYToolBarPopView ()
/**
 *  弹出的View
 */
@property (nonatomic, weak)UIImageView *popView;
/**
 *  分享
 */
@property (nonatomic, weak)UIButton *share;
/**
 *  拉黑
 */
@property (nonatomic, weak)UIButton *pullBlack;
/**
 *  举报
 */
@property (nonatomic, weak)UIButton *report;

@end

@implementation RYToolBarPopView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //初始化子试图
        [self setupSubViews];
        //属性的配置
        self.backgroundColor = [UIColor clearColor];
        self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
        
    }
    return self;
}
/**
 *  初始化子试图
 */
- (void)setupSubViews
{
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pop_up"]];
//    pop_up
//    view.backgroundColor = [UIColor blackColor];
//    view.alpha = 0.8;
    view.alpha = 0.8;
    view.userInteractionEnabled = YES;
    view.size = CGSizeMake(kPopViewW, kPopViewH);
    [self addSubview:view];
    self.popView = view;
    
    //创建分享按钮
    UIButton *btn = [self setupBtnWithTitle:@"分享" image:@"even_more_share" SEL:@selector(shareClick:)];
    [self.popView addSubview:btn];
    
    self.share = btn;
    //创建拉黑按钮
    btn = [self setupBtnWithTitle:@"拉黑" image:@"even_more_blacklist" SEL:@selector(pullBlackClick:)];
    [self.popView addSubview:btn];
    self.pullBlack = btn;
    //创建举报按钮
    btn = [self setupBtnWithTitle:@"举报" image:@"even_more_report" SEL:@selector(reportClick:)];
    [self.popView addSubview:btn];
    self.report = btn;
    //计算各个button的 frame
    NSInteger btnW = self.popView.width;
    NSInteger btnH = (self.popView.height )/3;
    NSInteger btnX = 0;
    NSInteger btnY = 0;
    for (int i = 0; i < self.popView.subviews.count; i++) {
        btnY = i * btnH;
        UIButton *btn = [self.popView.subviews objectAtIndex:i];
        btn.frame = CGRectMake(btnX, btnY-5, btnW, btnH);
    }
}
/**
 *
 *  在targetView 显示
 */
+ (void)showInView:(UIView *)targetView
{
    //计算出popView的位置
    CGRect rect = targetView.frame;
    CGRect tempRect = [kKeyWindow convertRect:rect fromView:targetView];
    NSInteger rectX = kScreenW - kPopViewW - 15;
    NSInteger rectY = tempRect.origin.y - kPopViewH + 9;
    
    CGRect popViewFrame = CGRectMake(rectX, rectY, kPopViewW, kPopViewH);
    RYToolBarPopView *popView = [[self alloc] init];
    popView.popView.frame = popViewFrame;
    
    [kKeyWindow addSubview:popView];
}
/**
 *  移除 弹窗
 */
- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //移除
    [self dismiss];
}


- (void)shareClick:(UIButton *)sender
{
    RYLog(@"分享");
    //移除
    [self dismiss];
    
}
- (void)pullBlackClick:(UIButton *)sender
{
    RYLog(@"拉黑");
    //移除
    [self dismiss];
}

- (void)reportClick:(UIButton *)sender
{
    RYLog(@"举报");
    //移除
    [self dismiss];
}

- (UIButton *)setupBtnWithTitle:(NSString *)title image:(NSString *)image SEL:(SEL)sel
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateHighlighted)];
    [btn setTitle:title forState:(UIControlStateNormal)];
    
    [btn addTarget:self action:sel forControlEvents:(UIControlEventTouchUpInside)];
    
    return  btn;
}
@end
