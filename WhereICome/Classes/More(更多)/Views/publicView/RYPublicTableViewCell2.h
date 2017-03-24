//
//  RYPublicTableViewCell2.h
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYPublicTableViewCell2 : UITableViewCell

// 留言者的头像
@property (nonatomic, strong) UIImageView *imageLag;

// 留言者的昵称
@property (nonatomic, strong) UILabel *labelName;

// 留言时间
@property (nonatomic, strong) UILabel *labelTime;

// 留言内容
@property (nonatomic, strong) UILabel *labelContent;


@end
