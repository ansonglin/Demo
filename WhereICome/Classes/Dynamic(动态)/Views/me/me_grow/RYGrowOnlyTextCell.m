//
//  RYGrowOnlyTextCell.m
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYGrowOnlyTextCell.h"

@implementation RYGrowOnlyTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat R  = (CGFloat) 242/255.0;
        CGFloat G = (CGFloat) 242/255.0;
        CGFloat B = (CGFloat) 242/255.0;
        CGFloat alpha = (CGFloat) 1.0;
        UIColor *ColorRGB = [ UIColor colorWithRed: R green: G blue: B alpha: alpha];
        self.backgroundColor = ColorRGB;
        
        // 创建小圆圈
        UIImageView *imageMin = [[UIImageView alloc] initWithFrame:CGRectMake(5.5, 7.5, 19, 19)];
        imageMin.image = [UIImage imageNamed:@"growth_log_circle"];
        [self addSubview:imageMin];
        
        // 创建时间
        self.labelTime = [[UILabel alloc] init];
        _labelTime.textColor = [UIColor colorWithRed:191 / 255.0 green:191 / 255.0 blue:191 / 255.0 alpha:1];
        [self addSubview:_labelTime];
        
        // 日志文本
        self.labelContent = [[UILabel alloc] init];
        _labelContent.numberOfLines = 0;
        
        // 创建白色底图
        self.viewA = [[UIView alloc] init];
        _viewA.backgroundColor = [UIColor whiteColor];
        [_viewA addSubview:_labelContent];
        [self addSubview:_viewA];
    
        // 创建灰色的竖线
        self.labelLine = [[UILabel alloc] init];
        _labelLine.backgroundColor = [UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:200 / 255.0 alpha:1];
        [self addSubview:_labelLine];
        
        // 创建时间
//        self.labelAge = [[UILabel alloc] init];
//        _labelAge.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:76 / 255.0 blue:49 / 255.0 alpha:1];
//        _labelAge.textColor = [UIColor whiteColor];
//        _labelAge.font = [UIFont systemFontOfSize:12.0f];
//        [self addSubview:_labelAge];

        // 创建权限
//        self.labelJude = [[UILabel alloc] init];
//        _labelJude.backgroundColor = [UIColor colorWithRed:0 / 255.0 green:117 / 255.0 blue:169 / 255.0 alpha:1];
//        _labelJude.textColor = [UIColor whiteColor];
//        _labelJude.font = [UIFont systemFontOfSize:12.0f];
//        [_viewA addSubview:_labelJude];

    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 时间
    _labelTime.frame = CGRectMake(37, 10, kScreenW - 40, 14);
    // 年龄
//    _labelAge.frame = CGRectMake(kScreenW - 65, 24, 50, 12);
   
    // 根据字符串长度来自适应日志的高度
    CGSize sizeName = CGSizeMake(kScreenW - 60, 1000);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0f], NSFontAttributeName, nil];
    CGRect msgSieName = [self.labelContent.text boundingRectWithSize:sizeName options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dic context:nil];
    CGFloat hight = msgSieName.size.height;
    
    // 白色背景图
    _viewA.frame = CGRectMake(25, 36, kScreenW - 40, hight + 20);
    // 权限
//    _labelJude.frame = CGRectMake(_viewA.frame.size.width - 60, _viewA.frame.size.height - 12 , 60, 12);
    // 内容
    _labelContent.frame = CGRectMake(10, 10, _viewA.frame.size.width - 20, hight);
    // 灰色的竖线
    _labelLine.frame = CGRectMake(15, 0, 1, hight + 64);
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
