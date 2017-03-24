//
//  RYProfile.m
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYProfile.h"

@implementation RYProfile


- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.icon = [dict objectForKey:@"icon"];
        self.profile = [dict objectForKey:@"text"];
    }
    return self;
}

+ (instancetype)profileWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
