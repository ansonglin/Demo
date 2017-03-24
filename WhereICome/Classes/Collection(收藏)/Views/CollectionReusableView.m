
//
//  CollectionReusableView.m
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "CollectionReusableView.h"

@interface CollectionReusableView ()<UIScrollViewDelegate>

{
    NSTimer *myTimer;
    NSInteger number;
}

@end

@implementation CollectionReusableView


// 在dealloc方法里面使代理和定时器置空
- (void)dealloc
{
    myTimer = nil;
    self.scrollView.delegate = nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
#pragma mark 循环滚动图片,从网络获取. 测试是用的本地图片
        self.imgArray = [NSMutableArray arrayWithObjects:@"collection_header", @"dynamic_banner", nil];
        // 定时器
        myTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
        number = 0;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 创建视图
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 58)];
    _scrollView.contentSize = CGSizeMake(self.imgArray.count * self.frame.size.width, 0);
    _scrollView.contentOffset = CGPointMake(0, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = FALSE;
    [self addSubview:self.scrollView];
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(kScreenW - 40, 40, 30, 15)];
    _pageControl.numberOfPages = self.imgArray.count;
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(pageAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.pageControl];
   
    [self loadViewAndImg];
}

// 加载图片
- (void)loadViewAndImg
{
    _scrollView.contentSize = CGSizeMake(self.imgArray.count * kScreenW, 58);
    _pageControl.numberOfPages = self.imgArray.count;
    for (int i = 0; i < self.imgArray.count; i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.contentSize.width / self.imgArray.count * i, 0, _scrollView.contentSize.width / self.imgArray.count, self.scrollView.frame.size.height)];
        NSString *str = [self.imgArray objectAtIndex:i];
        image.image = [UIImage imageNamed:str];
        [_scrollView addSubview:image];
    }
}

- (void)pageAction
{
    _scrollView.contentOffset = CGPointMake(_pageControl.currentPage * _scrollView.frame.size.width, 0);
}
#pragma UIScrollView的代理方法和实现
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{   // 关闭定时器
    [myTimer setFireDate:[NSDate distantFuture]];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{   // 开启定时器
    [myTimer setFireDate:[NSDate distantPast]];
}

// 定时器触发方法
-(void)timerAction
{
    number++;
    if (number < self.imgArray.count) {
        _scrollView.contentOffset = CGPointMake(number * _scrollView.frame.size.width, 0);
    } else {
        number = 0;
        _scrollView.contentOffset = CGPointMake(number * _scrollView.frame.size.width, 0);
    }
}




@end
