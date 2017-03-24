//
//  RYTabBarButton.h
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYTabBarButton : UIButton
/**
 *  根据传过来的 item 对象来进行设置 
 */
@property (nonatomic, strong)UITabBarItem *item;

@end
