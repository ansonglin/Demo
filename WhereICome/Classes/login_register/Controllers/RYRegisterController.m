//
//  RYRegisterController.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYRegisterController.h"
#import "UIView+corner.h"
#import "UIImage+resize.h"
#import "UIButton+countDown.h"
@interface RYRegisterController ()
/**
 *  用户名
 */
@property (weak, nonatomic) IBOutlet UITextField *userName;
/**
 *  验证码
 */
@property (weak, nonatomic) IBOutlet UITextField *verifiCodeTextField;
/**
 *  用户密码
 */
@property (weak, nonatomic) IBOutlet UITextField *userPwd;
/**
 *  分割线
 */
@property (weak, nonatomic) IBOutlet UIImageView *divderLine1;
/**
 *  分割线
 */

@property (weak, nonatomic) IBOutlet UIImageView *divderLine2;
/**
 *  分割线
 */
@property (weak, nonatomic) IBOutlet UIImageView *divderLine3;
/**
 *  注册按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
/**
 *  取消按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
/**
 *  获取验证码 按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *VerifyCodeBtn;

@end

@implementation RYRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 3.配置子视图
    [self configLoginSubView];
}
- (void)configLoginSubView
{
    //添加背景图片
//    NSString *name = @"login_ground_pic";
//    UIImage *bgImg = [UIImage resizeImageWithName:name];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:bgImg];
//    imageView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
//    [self.view insertSubview:imageView atIndex:0];
    
    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];

    UIColor *mainColor = [UIColor whiteColor];//RYColorFromRGB(0Xb7bbc1);
    [self.userName setTextColor:mainColor];
    [self.verifiCodeTextField setTextColor:mainColor];
    [self.userPwd setTextColor:mainColor];
    //分割线
    [self.divderLine1 setBackgroundColor:mainColor];
    [self.divderLine2 setBackgroundColor:mainColor];
    [self.divderLine3 setBackgroundColor:mainColor];
    //按钮
    [self.registerBtn setTitleColor:mainColor forState:(UIControlStateNormal)];
    [self.cancelBtn setTitleColor:mainColor forState:(UIControlStateNormal)];
    [self.VerifyCodeBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.registerBtn setUpViewCornerWidth:1 withBorderColor:mainColor withBorder:5];
    [self.cancelBtn setUpViewCornerWidth:1 withBorderColor:mainColor withBorder:5];
    [self.VerifyCodeBtn setUpViewCornerWidth:1 withBorderColor:[UIColor whiteColor] withBorder:5];
}

- (IBAction)registerBtnClick:(UIButton *)sender {
}
- (IBAction)cancelBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)VerifyCodeBtnClick:(UIButton *)sender {
    [sender startTime:6 title:@"重新发送" waitTittle:@"秒"];
    
}

//键盘事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.userName.isFirstResponder || self.verifiCodeTextField.isFirstResponder || self.userPwd.isFirstResponder) {
        [self.userName resignFirstResponder];
        [self.verifiCodeTextField resignFirstResponder];
        [self.userPwd resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
- (void)dealloc
{
    RYLog(@"register Vc dealloc");
}
@end
