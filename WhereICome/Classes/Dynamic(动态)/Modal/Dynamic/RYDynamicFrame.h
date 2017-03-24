//
//  RYDynamicFrame.h
//  WhereICome
//
//  Created by mkq on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  包括一个cell内部所有子控件的fame数据和显示数据

#import <Foundation/Foundation.h>

@class RYDynamic,RYDynamicCell;
@interface RYDynamicFrame : NSObject
/**
 *  顶部视图的frame
 */
@property (nonatomic, assign)CGRect topViewFrame;
/**
 *  照片视图的frame
 */
@property (nonatomic, assign)CGRect photoViewFrame;
/**
 *  照片视图的frame
 */
@property (nonatomic, assign)CGRect toolBarFrame;

/**
 *  cell 的高度
 */
@property (nonatomic, assign)CGFloat cellheight;

/**
 *  cell 数据
 */
@property (nonatomic, strong)RYDynamic *dynamic;


@end
