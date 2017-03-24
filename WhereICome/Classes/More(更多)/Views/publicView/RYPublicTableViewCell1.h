//
//  RYPublicTableViewCell1.h
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RYPublicTableViewCell1Delegate <NSObject>

- (void)changeHeightForRow:(BOOL)rowState;

@end

@interface RYPublicTableViewCell1 : UITableViewCell

@property (nonatomic, assign) id<RYPublicTableViewCell1Delegate> delegate;


// 详情 字符串可以展开和收起 默认显示两行
@property (nonatomic, strong) UILabel *labelStr;

// 展开收起按钮
@property (nonatomic, strong) UIButton *buttonStr;


// 展开收起状态
@property (nonatomic) BOOL state;

@end
