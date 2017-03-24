//
//  RYSafeViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYSafeViewController : UIViewController
// 用来显示安全隐私内容
@property (nonatomic, strong) UILabel *label;
// 内容过多是可以滑动观看
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSString *titleA;
@property (nonatomic, strong) NSString *content;

@end
