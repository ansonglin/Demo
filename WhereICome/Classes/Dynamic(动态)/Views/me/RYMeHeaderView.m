//
//  RYMeHeaderView.m
//  WhereICome
//
//  Created by mkq on 15/5/30.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMeHeaderView.h"
#import "UIImage+resize.h"


@interface RYMeHeaderView ()

/**
 *  用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *icon;
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UILabel *userName;
/**
 *  个性签名
 */
@property (weak, nonatomic) IBOutlet UILabel *sign;

@property (weak, nonatomic) IBOutlet UIView *topView;
/**
 *  背景图
 */
@property (weak, nonatomic)UIImageView *topViewBg;

@end

@implementation RYMeHeaderView


+ (instancetype)headerView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"RYMeHeaderView" owner:self options:nil] firstObject];
}

- (void)awakeFromNib
{
//    self.backgroundColor = [UIColor redColor];
    [super awakeFromNib];
    
    NSInteger iconH = self.icon.frame.size.height;
    self.icon.width = iconH;
    self.icon.layer.cornerRadius = iconH * 0.5;
    self.icon.layer.masksToBounds = YES;
    //插入背景图
    UIImage *bgImage = [UIImage resizeImageWithName:@"me_background_pic"];
    UIImageView *bgView = [[UIImageView alloc] initWithImage:bgImage];
    bgView.frame = self.topView.bounds;
    [self.topView insertSubview:bgView atIndex:0];
    self.topViewBg = bgView;
    //属性的配置
//    RYLog(@"%@",self);
}
/**
 *  关注按钮
 */
- (IBAction)focusBtnClick:(UIButton *)sender {
    
}
/**
 *  粉丝按钮
 */
- (IBAction)fansBtnClick:(UIButton *)sender {
}

/**
 *  等级 按钮点击
 */
- (IBAction)levelBtnClick:(UIButton *)sender {
}
/**
 *  签到按钮
 */
- (IBAction)signInBtnClick:(UIButton *)sender {
    if (self.signBlock) {
        self.signBlock();
    }
}
/**
 *  相册按钮
 */
- (IBAction)albumBtnClick:(UIButton *)sender {
    //打开相册
    if(self.photoBlock){
        self.photoBlock();
    }
}
/**
 *  皮肤按钮
 */
- (IBAction)skipBtnClick:(UIButton *)sender {
    NSArray *array = [NSArray arrayWithObjects:@"dynamic_picture_a.jpg", @"dynamic_picture_b.jpg", @"dynamic_picture_c.jpg", @"me_background_pic", nil];
    
    self.topViewBg.alpha = 0;
    self.topViewBg.image = [UIImage imageNamed:[array objectAtIndex:arc4random() % 4]];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.topViewBg.alpha = 1;
    }];
}

@end
