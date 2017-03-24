//
//  RYPublicModel.h
//  WhereICome
//
//  Created by 安松林 on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYPublicModel : NSObject

// 留言者头像
@property (nonatomic, copy) NSString *strImage;

// 留言者昵称
@property (nonatomic, copy) NSString *strName;

// 留言时间
@property (nonatomic, copy) NSString *strTime;

// 留言内容
@property (nonatomic, copy) NSString *strContent;

@end
