//
//  RYIdolCollectionViewCell.h
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYIdolCollectionViewCell : UICollectionViewCell

// 图片名字
@property (nonatomic, copy) NSString *image;
// 图片视图
@property (nonatomic, strong) UIImageView *imageView;

// 宝宝介绍
@property (nonatomic, strong) UILabel *label;

@end
