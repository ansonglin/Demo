//
//  DateTableViewCell.h
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *labelTitle;// 分组名
@property (nonatomic, strong) UILabel *labelNumber;// 分组人数
@property (nonatomic, strong) UILabel *labelContent;// 分组人标签
@property (nonatomic, strong) UIImageView *imageA;// 分组图像

@property (nonatomic) BOOL state;

- (void)setupWithTitle:(NSString *)title contentText:(NSString *)contentText numberTest:(NSString *)numberTest level:(NSInteger)level imageI:(NSString *)image;



@end
