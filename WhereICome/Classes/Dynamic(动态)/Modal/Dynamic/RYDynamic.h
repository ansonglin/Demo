//
//  RYDynamic.h
//  WhereICome
//
//  Created by mkq on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  动态首页的模型

#import <Foundation/Foundation.h>

@interface RYDynamic : NSObject
/**
*  用户头像
*/
@property (nonatomic, copy)NSString *icon;
/**
 *  名字
 */
@property (nonatomic, copy)NSString *name;
/**
 *  时间
 */
@property (nonatomic, copy)NSString *time;
/**
 *  地址
 */
@property (nonatomic, copy)NSString *adress;
/**
 *  内容
 */
@property (nonatomic, copy)NSString *content;
/**
 *  照片
 */
@property (nonatomic, strong)NSArray *photos;
/**
 *  时间
 */
@property (nonatomic, copy)NSString *like;
/**
 *  评论
 */
@property (nonatomic, copy)NSString *comment;
/**
 *  收藏
 */
@property (nonatomic, copy)NSString *collect;
/**
 *  快速创建
 */
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)dynamicWithDict:(NSDictionary *)dict;


@end
