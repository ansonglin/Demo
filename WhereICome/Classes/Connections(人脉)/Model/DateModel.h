//
//  DateModel.h
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSArray *children;
@property (strong, nonatomic) NSString *imageI;

- (id)initWithName:(NSString *)name  imageI:(NSString *)image children:(NSArray *)children;

+ (id)dataObjectWithName:(NSString *)name imageI:(NSString *)image children:(NSArray *)children;



@end
