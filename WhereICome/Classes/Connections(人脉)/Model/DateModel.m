//
//  DateModel.m
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

- (id)initWithName:(NSString *)name imageI:(NSString *)image children:(NSArray *)children{
    self = [super init];
    if (self) {
        self.children = [NSArray arrayWithArray:children];
        self.name = name;
        self.imageI = image;
    }
    return self;
}

+ (id)dataObjectWithName:(NSString *)name imageI:(NSString *)image children:(NSArray *)children{
    return [[self alloc] initWithName:name imageI:image children:children];
}


@end
