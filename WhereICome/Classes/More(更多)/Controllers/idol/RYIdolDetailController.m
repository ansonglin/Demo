//
//  RYIdolDetailController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYIdolDetailController.h"

@interface RYIdolDetailController ()<UIScrollViewDelegate>

@end

@implementation RYIdolDetailController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.imageArray = [NSArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(60, 80, self.view.frame.size.width - 120, 30)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"明星宝宝";
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 30, 10, 20);
    [button setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self createScroll];
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createScroll
{
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:_imageArray];
    [array insertObject:[_imageArray lastObject] atIndex:0];
    [array addObject:[_imageArray objectAtIndex:0]];
    // 创建一个大的UIScrollView来放置所有的图片
    self.scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 140, self.view.frame.size.width, self.view.frame.size.width)];
    [_scroll setContentSize:CGSizeMake([array count] * _scroll.frame.size.width, 0)];
    _scroll.delegate = self;
    _scroll.tag = 100;
    [_scroll setPagingEnabled:YES];
    [self.view addSubview:_scroll];
    // for循环创建UIScrollView,每个UIScrollView上面放置一张图片
    for (int i = 0; i < [array count]; i++) {
        UIScrollView *little = [[UIScrollView alloc] initWithFrame:CGRectMake(i * _scroll.frame.size.width, 0, _scroll.frame.size.width, _scroll.frame.size.height)];
        little.delegate = self;
        little.maximumZoomScale = 2.0f;
        little.minimumZoomScale = 0.5f;
        [_scroll addSubview:little];
        // 创建UIImageView来放置图片
        UIImageView *aImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, little.frame.size.width, little.frame.size.height)];
        [aImage setImage:[UIImage imageNamed:[array objectAtIndex:i]]];
        [little addSubview:aImage];
    }
    // 用来确保显示当前图片
    for (int i = 1; i < [array count]; i++) {
        NSString *name = [array objectAtIndex:i];
        if ([name isEqualToString:self.imageName]) {
            [_scroll setContentOffset:CGPointMake(i * _scroll.frame.size.width, 0)];
            break;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
//使其居中缩放
- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    UIImageView *view = [scrollView.subviews objectAtIndex:0];
    view.center = CGPointMake(_scroll.frame.size.width / 2, _scroll.frame.size.height / 2);
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if (scrollView.tag == 100) {
        if (scrollView.contentOffset.x == 0) {
            [scrollView setContentOffset:CGPointMake([_imageArray count] * scrollView.frame.size.width, 0)];
        } else if (scrollView.contentOffset.x == ([_imageArray count]+ 1) * scrollView.frame.size.width) {
            [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
        }
        
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        if (self.currentIndex != index) {
            for (UIScrollView *aView in [scrollView subviews]) {
                // 判断当前对象是不是相对应的类型,使经过放大或缩小的图片恢复原样
                if ([aView isKindOfClass:[UIScrollView class]]) {
                    [aView setZoomScale:1.0f];
                }
            }
        }
        self.currentIndex = -1;
    }
}
// 使其可以缩放
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if (scrollView.tag != 100) {
        UIScrollView *big = (UIScrollView *)[self.view viewWithTag:100];
        self.currentIndex = 0;
        for (UIScrollView *scroll in [big subviews]) {
            if (scroll == scrollView) {
                break;
            }
            _currentIndex++;
        }
        
        UIView *aView = [[scrollView subviews] objectAtIndex:0];
        return aView;
    }
    return nil;
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
