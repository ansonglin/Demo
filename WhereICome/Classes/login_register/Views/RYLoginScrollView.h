//
//  RYLoginScrollView.h
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RYLoginScrollView;

/**
 *  设置这个代理的目的是为了解决键盘的退出事件
 */
@protocol RYLoginScrollViewDelegate <NSObject>
/**
 *  LoginScrollView 被点击
 */
- (void)LoginScrollView:(RYLoginScrollView *)scrollView clicked:(UIEvent *)event;

@end


@interface RYLoginScrollView : UIScrollView

@property (nonatomic, assign)id<RYLoginScrollViewDelegate> loginViewDetegate;

@end
