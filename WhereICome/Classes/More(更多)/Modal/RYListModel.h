//
//  RYListModel.h
//  WhereICome
//
//  Created by 安松林 on 15/5/29.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYListModel : NSObject

// 动画类型
@property (nonatomic, copy) NSString *title;

// 更多
@property (nonatomic, copy) NSString *moreTitle;

// 图片
@property (nonatomic, copy) NSString *btnImage;

// 动画名
@property (nonatomic, copy) NSString *btnTitle;

// 动画详情
@property (nonatomic, copy) NSString *content;

@end
