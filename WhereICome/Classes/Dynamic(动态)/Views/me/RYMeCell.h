//
//  RYMeCell.h
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RYProfile;
@interface RYMeCell : UITableViewCell
/**
 *
 *  返回一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

/**
 *  模型对象
 */
@property (nonatomic, strong)RYProfile *profile;

@end
