//
//  RYPublicTableViewCell1.m
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPublicTableViewCell1.h"

@implementation RYPublicTableViewCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 详情 字符串可以展开和收起
        self.labelStr = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenW - 20, 40)];
        _labelStr.numberOfLines = 0;
        _labelStr.font = [UIFont systemFontOfSize:15];
        [self addSubview:_labelStr];
        
        // 展开收起按钮
        self.buttonStr = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonStr.frame = CGRectMake(kScreenW - 52, 50, 40, 12);
        [_buttonStr setTitle:@"展开>" forState:UIControlStateNormal];
        [_buttonStr addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_buttonStr];
        
        _state = YES;
        
    }
    return self;
}

- (void)buttonAction
{
    if (_state == YES) {
        // 当展开按钮状态为YES时, 根据文本的高度来改变UILabel和UIButton的高
        CGSize size = CGSizeMake(kScreenW - 20, 1000);
        CGSize msgSie = [_labelStr.text sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:size];
        
        _labelStr.frame = CGRectMake(10, 10, kScreenW - 20, msgSie.height);
        
        _buttonStr.frame = CGRectMake(kScreenW - 52, 10 + msgSie.height, 40, 12);
        [_buttonStr setTitle:@"收起>" forState:UIControlStateNormal];
        [self.delegate changeHeightForRow:_state];
        _state = NO;
    } else {
        // 当展开按钮状态为NO时, 还原UILabel和UIButton的高
        _labelStr.frame = CGRectMake(10, 10, kScreenW - 20, 40);
        _buttonStr.frame = CGRectMake(kScreenW - 52, 50, 40, 12);
        [_buttonStr setTitle:@"展开>" forState:UIControlStateNormal];
        [self.delegate changeHeightForRow:_state];
        _state = YES;
    }

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
