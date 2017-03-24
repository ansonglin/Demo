
//
//  RYTeacherTableViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTeacherTableViewCell.h"

@implementation RYTeacherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       // 老师图片
        self.Image = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 100, 100)];
        [self addSubview:_Image];
        // 老师名字
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 15, kScreenW / 3, 16)];
        [self addSubview:_nameLabel];
        // 收藏按钮
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(kScreenW - 38, 12, 22.5, 21.5);
        [_button setBackgroundImage:[UIImage imageNamed:@"teacher_collection"] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        // 老师简介
        self.labelContent = [[UILabel alloc] initWithFrame:CGRectMake(130, 41, kScreenW - 150, 45)];
        _labelContent.textColor = [UIColor grayColor];
        _labelContent.font = [UIFont systemFontOfSize:13];
        _labelContent.numberOfLines = 0;
        [self addSubview:_labelContent];
        // 老师标签
        self.labelTool = [[RYTeacherTool alloc] initWithFrame:CGRectMake(130, 90, kScreenW / 3, 12)];
        [self addSubview:_labelTool];
        
        
        _state = YES;
    }
    return self;
}
#pragma mark - 
#pragma mark 点赞按钮点击事件
- (void)buttonAction
{
    RYLog(@"dddddf");
    if (_state == YES) {
        [_button setBackgroundImage:[UIImage imageNamed:@"teacher_collection_se"] forState:UIControlStateNormal];
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"收藏成功" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert1 show];
        // 使alert定时消失
        [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(timerFireMethod:) userInfo:alert1 repeats:YES];
        _state = NO;
    } else {
        [_button setBackgroundImage:[UIImage imageNamed:@"teacher_collection"] forState:UIControlStateNormal];
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"收藏取消" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
        [alert1 show];
        // 使alert定时消失
        [NSTimer scheduledTimerWithTimeInterval:0.8f target:self selector:@selector(timerFireMethod:) userInfo:alert1 repeats:YES];
        _state = YES;
    }
}

- (void)timerFireMethod:(NSTimer*)theTimer//弹出框
{
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert = NULL;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
