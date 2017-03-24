//
//  RYTopView.h
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
//cell 中顶部的信息(用户名  用户头像  地址  时间  正文)
//高度
#define kCellTopViewHeight 70
//用户头像大小
#define kUserIconW 40
#define kUserIconH 40
//地址的长度
#define kAdressBtnW    120
#define kAdressBtnH    18
#define kAdressBtnFont [UIFont systemFontOfSize:12]
#import <UIKit/UIKit.h>

@interface RYTopView : UIView
/**
 *  用户头像
 */
@property (nonatomic, weak)UIImageView *icon;
/**
 *  用户名
 */
@property (nonatomic, weak)UILabel *userName;
/**
 *  时间
 */
@property (nonatomic, weak)UILabel *time;
/**
 *  地址
 */
@property (nonatomic, weak)UIButton *adress;
/**
 *  发表内容
 */
@property (nonatomic, weak)UILabel *content;

/**
 *  topView 的高度
 */
@property (nonatomic, assign)CGFloat topViewH;

@end
