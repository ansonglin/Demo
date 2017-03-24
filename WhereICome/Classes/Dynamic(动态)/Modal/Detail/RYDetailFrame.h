//
//  RYDetailFrame.h
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYDetail.h"

@interface RYDetailFrame : NSObject
/**
 *  数据源对象
 */
@property (nonatomic, strong)RYDetail *detail;
/**
 *  头像的frame
 */
@property (nonatomic, assign)CGRect iconFrame;
/**
 *  名字的frame
 */
@property (nonatomic, assign)CGRect userNameFrame;
/**
 *  时间的frame
 */
@property (nonatomic, assign)CGRect timeFrame;

/**
 *  发表内容的frame
 */
@property (nonatomic, assign)CGRect commentConFrame;
/**
 *  cell 的高度
 */
@property (nonatomic, assign)NSInteger cellHeight;

@end
