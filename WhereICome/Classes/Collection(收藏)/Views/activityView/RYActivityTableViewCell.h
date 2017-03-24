//
//  RYActivityTableViewCell.h
//  WhereICome
//
//  Created by 安松林 on 15/6/11.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYActivityTableViewCell : UITableViewCell

// 活动图片
@property (nonatomic, strong) UIImageView *bigImage;

// 活动标签
@property (nonatomic, strong) UILabel *labelTag;

// 活动放置标签
@property (nonatomic, strong) UIView *view;

@end
