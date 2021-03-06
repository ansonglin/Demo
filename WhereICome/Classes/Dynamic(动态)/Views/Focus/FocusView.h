//
//  FocusView.h
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  无限循环的，可以用手滑动，图片要动态加载，
//  需要一个pageControl表明滑动到第几张图片，

#import <UIKit/UIKit.h>
@interface FocusView : UIView<UIScrollViewDelegate>

-(id)initWithFrame:(CGRect)frame Images:(NSArray *)images;
-(void)startTimer;

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSTimer *timer;

@end
