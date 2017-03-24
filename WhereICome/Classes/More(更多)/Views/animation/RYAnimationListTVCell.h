//
//  RYAnimationListTVCell.h
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYListBtn.h"

@interface RYAnimationListTVCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *button;

// 动画页面cell里面第一张图片
@property (nonatomic, strong) RYListBtn *buttonOne;

// 动画页面cell里面第二张图片
@property (nonatomic, strong) RYListBtn *buttonTwo;

// 动画页面cell里面第三张图片
@property (nonatomic, strong) RYListBtn *buttonThree;


@end
