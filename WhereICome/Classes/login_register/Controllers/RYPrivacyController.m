//
//  RYPrivacyController.m
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPrivacyController.h"
#import "UIView+corner.h"
#import "RYRegisterController.h"
#import "UIImage+resize.h"
@interface RYPrivacyController ()

@property (weak, nonatomic) IBOutlet UIButton *agreeBtn;

@property (weak, nonatomic) IBOutlet UIButton *dissAgreeBtn;

@end

@implementation RYPrivacyController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubViews];
}

- (void)configSubViews
{
    //添加背景图片
//    NSString *name = @"login_ground_pic";
//    UIImage *bgImg = [UIImage resizeImageWithName:name];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:bgImg];
//    imageView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
//    [self.view insertSubview:imageView atIndex:0];
    
    
    
    [self.agreeBtn setUpViewCornerWidth:1 withBorderColor:RYColorFromRGB(0Xbbbbbb) withBorder:5];
    [self.dissAgreeBtn setUpViewCornerWidth:1 withBorderColor:RYColorFromRGB(0Xbbbbbb) withBorder:5];
    
#warning 改变边框颜色
    [self.agreeBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.dissAgreeBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    [self.agreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.dissAgreeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}

/**
 *  同意按钮点击
 */
- (IBAction)agreeBtnClick:(UIButton *)sender {
     RYRegisterController *registerVc = [[RYRegisterController alloc] initWithNibName:@"RYRegisterController" bundle:nil];
    [self presentViewController:registerVc animated:YES completion:nil];
    
}

/**
 *  不同意按钮点击
 */
- (IBAction)dissAgreeBtnClick:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    RYLog(@"private Vc dealloc");
}
@end
