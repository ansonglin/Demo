//
//  RYCollectionBookTVCell.h
//  WhereICome
//
//  Created by 安松林 on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYBookTools.h"

@interface RYCollectionBookTVCell : UITableViewCell
// 成长书籍的标签
@property (nonatomic, strong) RYBookTools *labelTool;

//  成长书籍的图片
@property (nonatomic, strong) UIImageView *ImageView;

// 成长书籍的书名
@property (nonatomic, strong) UILabel *labelName;

// 成长书籍的简介
@property (nonatomic, strong) UILabel *labelContent;

// 学校的距离标签
@property (nonatomic, strong) UILabel *labelLoction;

@end
