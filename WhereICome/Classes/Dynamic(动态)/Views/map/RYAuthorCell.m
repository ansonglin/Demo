//
//  RYAuthorCell.m
//  WhereICome
//
//  Created by mkq on 15/6/9.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAuthorCell.h"

@implementation RYAuthorCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame
{
    CGRect tempRect = frame;
    tempRect.size.height -= 1;
    [super setFrame:tempRect];
}
@end
