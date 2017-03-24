//
//  RYMeCell.m
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMeCell.h"
#import "UIImage+resize.h"
#import "RYProfile.h"

@implementation RYMeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *
 *  返回一个cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *meCellId = @"meCellId";
    RYMeCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:meCellId];
    if (cell == nil) {
        cell = [[RYMeCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:meCellId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.textLabel setFont:[UIFont systemFontOfSize:15]];
        UIImage *divderImage = [UIImage resizeImageWithName:@"divider"];
        UIImageView *divder = [[UIImageView alloc] initWithImage:divderImage];
        divder.frame = CGRectMake(0, self.height - 0.5, kScreenW, 0.5);
        [self.contentView addSubview:divder];
    }
    return self;
}


- (void)setFrame:(CGRect)frame
{
    CGRect tempRect = frame;
    tempRect.size.height -= 0.5;
    [super setFrame:tempRect];
}

- (void)setProfile:(RYProfile *)pro
{
    [self.textLabel setText:pro.profile];
    self.imageView.image = [UIImage imageNamed:pro.icon];
}

@end
