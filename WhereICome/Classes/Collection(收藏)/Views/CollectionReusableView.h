//
//  CollectionReusableView.h
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionReusableView : UICollectionReusableView<UIScrollViewDelegate>

// 定时滚动图片
@property (nonatomic, strong) UIScrollView *scrollView;
// pageControl
@property (nonatomic, strong) UIPageControl *pageControl;

// 定时滚动的图片
@property (nonatomic, strong) NSMutableArray *imgArray;





@end
