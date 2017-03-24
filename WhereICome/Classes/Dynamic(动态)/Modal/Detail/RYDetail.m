//
//  RYDetail.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYDetail.h"

@implementation RYDetail

+ (instancetype)detailWithDict:(NSDictionary*)dict
{
    return  [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        self.icon = [dict objectForKey:@"icon"];
        
        self.userName = [dict objectForKey:@"userName"];
        
        self.time = [dict objectForKey:@"time"];
        
        self.commentCon = [dict objectForKey:@"content"];
    }
    return self;
}
@end
