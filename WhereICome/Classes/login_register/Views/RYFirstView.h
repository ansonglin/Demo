//
//  RYFirstView.h
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYFirstView : UIView

// 引导页logo
//@property (nonatomic, strong) UIImageView *imageLogo;

// 引导页标题
//@property (nonatomic, strong) UIImageView *imageTitle;

// 登录按钮
@property (nonatomic, strong) UIButton *buttonLogin;

// 注册按钮
@property (nonatomic, strong) UIButton *buttonRegister;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate;

@end
