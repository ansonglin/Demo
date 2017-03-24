//
//  FocusView.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//图片滚动时间
#define kScrollTime 2.5

#import "FocusView.h"

@implementation FocusView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame Images:(NSArray *)images{
    self = [super initWithFrame:frame];
    if (self) {
        //组合图片
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:images.count +2];
        [mutableArray addObject:images.lastObject];
        [mutableArray addObjectsFromArray:images];
        [mutableArray addObject:images[0]];
        _images = mutableArray;
    }
    return self;
}

- (void)setImages:(NSArray *)images
{
    _images = images;
    //组合图片
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:images.count +2];
    [mutableArray addObject:images.lastObject];
    [mutableArray addObjectsFromArray:images];
    [mutableArray addObject:images[0]];
    _images = mutableArray;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    //初始化内容
    UIScrollView *crollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    crollView.showsHorizontalScrollIndicator = NO;
    crollView.showsVerticalScrollIndicator = NO;
    crollView.contentSize = CGSizeMake(self.images.count  * self.frame.size.width, self.frame.size.height);
    self.scrollView = crollView;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    
    for (int i = 0; i < self.images.count; i++) {
#warning 本地图片 实际上是网络图片 需要下载
        NSString *imageStr = self.images[i];
        
        UIImage *image = [UIImage imageNamed:imageStr];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = CGRectOffset(self.scrollView.frame, i* self.frame.size.width, 0);
        [self.scrollView addSubview:imageView];
    }
    [self addSubview:self.scrollView];
    //默认显现第0张图片
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width, 0)];
}

-(void)startTimer{
    //启动一个定时器
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:kScrollTime target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    }
}

-(void)timerFire:(NSTimer*)timer{
//    设置srlloView偏移
    //判断偏移量，确定何时回归第零张
    CGPoint point = CGPointZero;
    if (self.scrollView.contentOffset.x >= (self.images.count - 1)* self.frame.size.width) {
        point = CGPointMake(self.frame.size.width, 0);
        [self.scrollView setContentOffset:point];
    }
    point = CGPointMake(self.scrollView.contentOffset.x + self.frame.size.width, 0);
    
    [UIView animateWithDuration:.5f animations:^{
        [self.scrollView setContentOffset:point animated:NO];
    }];
}

-(void)stopTimer{
    //停止Timer；
    [self.timer invalidate];
    self.timer = nil;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //开始拖拽
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //停止拖拽
    [self startTimer];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.scrollView.contentOffset.x < 0) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width * (self.images.count - 2), 0)];
    }
    if (self.scrollView.contentOffset.x > (self.images.count - 1) * scrollView.frame.size.width) {
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
    }
}

@end
