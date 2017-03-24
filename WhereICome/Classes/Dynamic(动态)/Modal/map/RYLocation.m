//
//  RYLocation.m
//  WhereICome
//
//  Created by mkq on 15/6/9.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYLocation.h"

@implementation RYLocation
/**
 *  快速创建对象
 */
+ (instancetype)locationWithLocation:(NSString *)location
{
    if (location != nil) {
        RYLocation *loc = [[self alloc] init];
        loc.location = location;
        return loc;
    }
    return nil;
}
@end
