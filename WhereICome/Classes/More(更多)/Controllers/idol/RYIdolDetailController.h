//
//  RYIdolDetailController.h
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYIdolDetailController : UIViewController

// 当前图片名字
@property (nonatomic, copy) NSString *imageName;
// 图片数组
@property (nonatomic, strong) NSArray *imageArray;
// 当前图片位置
@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) UIScrollView *scroll;

@end
