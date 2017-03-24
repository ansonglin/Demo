//
//  RYDetailCell.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//


#import "RYDetailCell.h"
#import "RYDetail.h"

@interface RYDetailCell ()

/**
 *  头像
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
 *  评论内容
 */
@property (nonatomic, weak)UILabel *commentCon;
@end


@implementation RYDetailCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellId = @"detailCellID";
    RYDetailCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellId];
    if (nil == cell) {
        cell = [[RYDetailCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellId];
    }
    return cell;
}

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

/**
 *  初始化子试图
 */
- (void)setupSubViews
{
    //用户头像
    UIImageView *icon = [[UIImageView alloc] init];
    icon.layer.masksToBounds = YES;
    [self addSubview:icon];
    self.icon = icon;
    //用户名
    UILabel *userName = [[UILabel alloc] init];
    userName.font = [UIFont boldSystemFontOfSize:15];
    [userName setTextColor:[UIColor blackColor]];
    [self addSubview:userName];
    self.userName = userName;
    //时间
    UILabel *time = [[UILabel alloc] init];
    time.font = [UIFont systemFontOfSize:13];
    [time setTextColor:RYColorFromRGB(0xa5a5a5)];
    [self addSubview:time];
    self.time = time;
    //评论内容
    UILabel *commentCon = [[UILabel alloc] init];
    commentCon.font = [UIFont systemFontOfSize:12];
    [commentCon setTextColor:RYColorFromRGB(0xa5a5a5)];
    commentCon.numberOfLines = 0;
    [self addSubview:commentCon];
    self.commentCon = commentCon;
    
}

- (void)setDetailFrame:(RYDetailFrame *)detailFrame
{
    _detailFrame = detailFrame;
    //设置位置
    self.icon.frame = detailFrame.iconFrame;
    self.userName.frame = detailFrame.userNameFrame;
    self.time.frame = detailFrame.timeFrame;
    self.commentCon.frame = detailFrame.commentConFrame;
    //设置数据
    RYDetail *detail =detailFrame.detail;
    //设置用户头像圆角
    NSInteger cornerR = detailFrame.iconFrame.size.width * 0.5;
    self.icon.layer.cornerRadius = cornerR;
    self.icon.image = [UIImage imageNamed:detail.icon];
    
    [self.userName setText:detail.userName];
    [self.time setText:detail.time];
    [self.commentCon setText:detail.commentCon];
}
@end
