//
//  RYLocation.h
//  WhereICome
//
//  Created by mkq on 15/6/9.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYLocation : NSObject
/**
 *  地理位置
 */
@property (nonatomic, copy)NSString *location;
/**
 *  快速创建对象
 */
+ (instancetype)locationWithLocation:(NSString *)location;
@end
