//
//  RYDetail.h
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYDetail : NSObject
/**
 *  头像
 */
@property (nonatomic, copy)NSString *icon;
/**
 *  用户名
 */
@property (nonatomic, copy)NSString *userName;
/**
 *  时间
 */
@property (nonatomic, copy)NSString *time;
/**
 *  评论内容
 */
@property (nonatomic, copy)NSString *commentCon;
/**
 *
 * 字典转模型
 */
+ (instancetype)detailWithDict:(NSDictionary*)dict;

- (instancetype)initWithDict:(NSDictionary*)dict;
@end
