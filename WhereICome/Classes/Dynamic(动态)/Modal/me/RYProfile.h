//
//  RYProfile.h
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYProfile : NSObject
/**
 *  展示的图标
 */
@property (nonatomic, copy)NSString *icon;
/**
 *  文字描述
 */
@property (nonatomic, copy)NSString *profile;
/**
 *  字典转模型
 */
- (instancetype)initWithDict:(NSDictionary *)dict;
/**
 *  快速创建一个对象
 */
+ (instancetype)profileWithDict:(NSDictionary *)dict;
@end
