//
//  RYProfileGroup.h
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYProfile.h"

@interface RYProfileGroup : NSObject
/**
 *  存放这个Group的的模型对象
 */
@property (nonatomic, strong)NSMutableArray *profils;

+ (instancetype)group;


@end
