//
//  RYSelectView.m
//  WhereICome
//
//  Created by mkq on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
#define kSelectViewHeight  40

#import "RYSelectView.h"
#import "NSString+TextSize.h"

@interface RYSelectView ()
@property (nonatomic, weak)UIImageView *jumpView;

@end


@implementation RYSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        //标题
        NSInteger detailX = 10;
        NSInteger detailY = 0;
        NSInteger detailW = 50;
        NSInteger detailH = kSelectViewHeight;
        CGRect detailFrame = CGRectMake(detailX, detailY, detailW, detailH);
        UILabel *detailLabel = [self setupLabelWithFrame:detailFrame withColor:[UIColor blackColor] withFont:14];
        [self addSubview:detailLabel];
        self.detailLabel = detailLabel;
        //图片jump
        UIImage *image = [UIImage imageNamed:@"jump"];
        UIImageView *jumpView = [[UIImageView alloc] initWithImage:image];
        NSInteger jumpImageW = 10;
        NSInteger jumpImageH = 20;
        NSInteger jumpImageY = (kSelectViewHeight - jumpImageH)*0.5;
        NSInteger jumpImageX = kScreenW -jumpImageW - 10;
        CGRect jumpViewFrame = CGRectMake(jumpImageX, jumpImageY, jumpImageW, jumpImageH);
        jumpView.frame = jumpViewFrame;
        [self addSubview:jumpView];
        self.jumpView = jumpView;
        //子标题
        UILabel *subLabel = [self setupLabelWithFrame:CGRectZero withColor:RYColorFromRGB(0Xb5c1c1) withFont:12];
        [subLabel sizeToFit];
        [self addSubview:subLabel];
        self.subLabel = subLabel;
        
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

+ (instancetype)selectViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}
/**
 *  代理的回调
 */
- (void)viewClick:(UITapGestureRecognizer *)tap
{
//    RYLog(@"======");
    if ([self.delegate respondsToSelector:@selector(selectView:didClick:)]) {
        [self.delegate selectView:self didClick:tap];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];

    //子标题
    CGSize textSize = [self.subLabel.text sizeWithFont:[UIFont systemFontOfSize:12] maxSize:CGSizeMake(kScreenW, MAXFLOAT)];
    NSInteger subLabelW = textSize.width;
    NSInteger subLabelX = CGRectGetMinX(self.jumpView.frame) - subLabelW - 10
    ;
    NSInteger subLabelY = 0;
    NSInteger subLabelH = kSelectViewHeight;
    CGRect subLabelFrame = CGRectMake(subLabelX, subLabelY, subLabelW, subLabelH);
    self.subLabel.frame = subLabelFrame;

}

/**
 *  快速创建一个label
 */
- (UILabel *)setupLabelWithFrame:(CGRect)frame withColor:(UIColor *)color withFont:(NSInteger)fontNum
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:fontNum];
    [label setTextColor:color];
    
    label.frame = frame;
    return label;
}

@end
