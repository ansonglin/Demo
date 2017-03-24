//
//  RYLocationController.h
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYViewController.h"

@class RYLocationController;
@protocol RYLocationControllerDelegate <NSObject>
/**
 *  当前的位置信息
 */
- (void)locationController:(RYLocationController *)locationController withLoctionString:(NSString *)locStr;

@end


@interface RYLocationController : RYViewController

@property (nonatomic, weak)id<RYLocationControllerDelegate> delegate;

@end
