//
//  RYDetailIconsView.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define kIconW  40
#define kIconH  40
#define kIconPading 10
#define kIconMargin 12

#define kpriaseBtnW 60
#import "RYDetailIconsView.h"
#import "UIImage+resize.h"
#import "RYTitleButton.h"

@interface RYDetailIconsView ()
/**
 *  滚动视图
 */
@property (nonatomic, weak)UIScrollView *scrollView;
/**
 *  点赞按钮
 */
@property (nonatomic, weak)UIButton *priaseBtn;

/**
 显示点赞人数的标签
 */
@property (nonatomic, weak)UILabel *priaseNums;

@end



@implementation RYDetailIconsView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //加载子试图
        [self setupSubViews];
        //属性设置
        self.userInteractionEnabled = YES;
        UIImage *bgImg = [UIImage resizeImageWithName:@"dynamic_divider"];
        self.image = bgImg;
    }
    return self;
}

- (void)setupSubViews
{
    //添加scrollView
    NSInteger scrollViewW = kScreenW - kpriaseBtnW;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scrollViewW, self.height)];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
//    scrollView.backgroundColor = [UIColor redColor];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    //添加点赞的
    RYTitleButton *priaseBtn = [RYTitleButton titleButton];

    NSInteger priaseBtnX = scrollViewW;
    NSInteger priaseBtnY = 5;
    NSInteger priaseBtnH = self.height - 5;
    CGRect priaseBtnRect = CGRectMake(priaseBtnX, priaseBtnY, kpriaseBtnW, priaseBtnH);
    priaseBtn.frame = priaseBtnRect;
    [priaseBtn setImage:[UIImage imageNamed:@"praise"] forState:(UIControlStateNormal)];
    [priaseBtn setImage:[UIImage imageNamed:@"praise_se"] forState:(UIControlStateHighlighted)];
    [priaseBtn setImage:[UIImage imageNamed:@"praise_se"] forState:(UIControlStateSelected)];
    [priaseBtn addTarget:self action:@selector(priaseBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [priaseBtn setTitle:@"124" forState:(UIControlStateNormal)];
    [priaseBtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
    [self addSubview:priaseBtn];
//    NSInteger priaseBtnX = scrollViewW;
//    NSInteger priaseBtnY = 5;
//    CGRect priaseBtnRect = CGRectMake(priaseBtnX, priaseBtnY, 30, 30   );
//    UIButton *priaseBtn = [[UIButton alloc] initWithFrame:priaseBtnRect];
//    [priaseBtn setImage:[UIImage imageNamed:@"praise"] forState:(UIControlStateNormal)];
//    [priaseBtn setImage:[UIImage imageNamed:@"praise_se"] forState:(UIControlStateHighlighted)];
//    [priaseBtn setImage:[UIImage imageNamed:@"praise_se"] forState:(UIControlStateSelected)];
//    [priaseBtn addTarget:self action:@selector(priaseBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    
//    [self addSubview:priaseBtn];
//    self.priaseBtn = priaseBtn;
//    //添加标签
//    NSInteger priaseNumsX = scrollViewW;
//    NSInteger priaseNumsY = CGRectGetMaxY(priaseBtnRect) + 2;
//    NSInteger priaseNumsH = 16;
//    CGRect priaseNumsRect = CGRectMake(priaseNumsX, priaseNumsY, 50, priaseNumsH);
//    UILabel *priaseNums = [[UILabel alloc] initWithFrame:priaseNumsRect];
//    [priaseNums setFont:[UIFont systemFontOfSize:14]];
//    [priaseNums setText:@"123"];
//    [self addSubview:priaseNums];
//    self.priaseNums = priaseNums;
    
}
- (void)priaseBtnClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    RYLog(@"点赞");
}

#warning 可能需要建一个专门的模型对象来描述  暂时用数组代替
- (void)setIcons:(NSArray *)icons
{
    _icons = icons;
    NSInteger iconX = 0;
    //计算每个
    UIImageView *imageView = nil;
    for (int i = 0; i < icons.count; i++) {
        NSString *str = [icons objectAtIndex:i];
        UIImage *image = [UIImage imageNamed:str];
        imageView = [[UIImageView alloc] initWithImage:image];
        imageView.userInteractionEnabled = YES;
        imageView.layer.cornerRadius = kIconH * 0.5;
        imageView.layer.masksToBounds = YES;
        [self.scrollView addSubview:imageView];
        //设置frame
        iconX = kIconMargin + i*(kIconW+kIconPading);
        imageView.frame = CGRectMake(iconX, 10, kIconW, kIconH);
    }
    //设置contentSize
    CGFloat lastImageViewX = CGRectGetMaxX(imageView.frame);
    self.scrollView.contentSize = CGSizeMake(lastImageViewX + kIconMargin, self.scrollView.height);
}

@end
