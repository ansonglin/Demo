//
//  RYAuthorityControllerViewController.h
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTabViewController.h"
@class RYAuthorityController;
@protocol RYAuthorityControllerDelegate <NSObject>
/**
 *  返回选中的权限
 */
- (void)authorityController:(RYAuthorityController *)controller WithSelectAuthor:(NSString *)authorString;

@end

@interface RYAuthorityController : RYTabViewController

@property (nonatomic, weak)id<RYAuthorityControllerDelegate>delegate;
@end
