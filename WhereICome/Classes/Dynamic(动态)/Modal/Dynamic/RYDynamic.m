//
//  RYDynamic.m
//  WhereICome
//
//  Created by mkq on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
/**
 *  @{
 @"icon":@"Head",
 @"name":@"haha",
 @"time":@"今天11:23",
 @"adress":@"在浙江 温州",
 @"content":@"最贵的东西不一定就是适合宝宝的,最设和宝宝的不一定是最贵的,我一直这么认为",
 @"photos":@[],
 @"like":@"1",
 @"comment":@"2",
 @"collect":@"3",
 };
 */
#import "RYDynamic.h"

@implementation RYDynamic

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = [dict objectForKey:@"icon"];
        self.name = [dict objectForKey:@"name"];
        self.time = [dict objectForKey:@"time"];
        self.adress = [dict objectForKey:@"adress"];
        self.photos = [dict objectForKey:@"photos"];
        self.content = [dict objectForKey:@"content"];
        self.like = [dict objectForKey:@"like"];
        self.comment = [dict objectForKey:@"comment"];
        self.collect = [dict objectForKey:@"collect"];
    }
    return self;
}

+ (instancetype)dynamicWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
