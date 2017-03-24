//
//  DemoViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoViewController : UIViewController

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) NSString *urlName;
@property (nonatomic, retain) UIActivityIndicatorView *indicator;

@end
