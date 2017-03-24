//
//  RYAnimationListVC.h
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYAnimationListView.h"

@interface RYAnimationListVC : UIViewController

@property (nonatomic, strong) RYAnimationListView *myView;
// 判断是那个页面
@property (nonatomic, assign) NSInteger state;

@end
