//
//  Area.h
//  省市区－老师－类的实现
//
//  Created by dlios on 14-11-10.
//  Copyright (c) 2014年 lanou3g.com 蓝鸥科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Area : NSObject
// 因为省和市类都有相同的类结构, 设计一个基类, 让省和市类继承于他

@property (nonatomic, retain) NSString *name;// 区域名
@property (nonatomic, retain) NSMutableArray *distructs;// 下属的地区数组
@end
