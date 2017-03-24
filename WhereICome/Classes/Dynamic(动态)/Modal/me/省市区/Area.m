//
//  Area.m
//  省市区－老师－类的实现
//
//  Created by dlios on 14-11-10.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import "Area.h"

@implementation Area

- (instancetype)init  // 只能在这个类中使用 与(id)相识
{
    self = [super init];
    if (self) {
        self.distructs = [NSMutableArray array];//1. 走一个setter方法进行一次持有，不要直接进行赋值
        
        
        
        
//        self.distructs = [[NSMutableArray alloc] init];
//        [_distructs release];// 2.
        
        
        

        
        

    }
    return self;
}

- (void)dealloc
{
    // 当为1时立马变为调用这个dealloc
    // 当这个类的对象引用计数减为1的时候，系统调用这个方法回收内存
    // 属性的内存管理
   
    NSLog(@"引用计数减为0，内存被系统回收");
    
}
//- (NSString *)description
//{
//    return [NSString stringWithFormat:@"\n name: %@, distruct: %@", self.name, self.distructs];
//}
@end
