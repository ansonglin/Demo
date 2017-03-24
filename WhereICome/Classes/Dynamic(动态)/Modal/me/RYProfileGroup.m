//
//  RYProfileGroup.m
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYProfileGroup.h"

@implementation RYProfileGroup

- (instancetype)init
{
    if (self = [super init]) {
        self.profils = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)group
{
    
    return [[self alloc] init];
}
@end
