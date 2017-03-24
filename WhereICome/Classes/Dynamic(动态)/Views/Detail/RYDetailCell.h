//
//  RYDetailCell.h
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYDetailFrame.h"

@interface RYDetailCell : UITableViewCell

/**
 *  包含所有子控件的frame
 */
@property (nonatomic, strong)RYDetailFrame *detailFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
