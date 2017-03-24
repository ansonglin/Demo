//
//  RYFootPrintController.m
//  WhereICome
//
//  Created by mkq on 15/6/2.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYInterrationController.h"
#import "FocusView.h"
#import "UIImage+resize.h"
@interface RYInterrationController ()
/**
 *  顶部的焦点图
 */
@property (weak, nonatomic) IBOutlet FocusView *topFocusView;
/**
 *  及时通讯按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *IMTalk;
/**
 *  在线
 */
@property (weak, nonatomic) IBOutlet UIButton *onLine;
/**
 *  留言
 */
@property (weak, nonatomic) IBOutlet UIButton *leaveMsg;
/**
 *  加好友
 */
@property (weak, nonatomic) IBOutlet UIButton *addFriend;
/**
 *  玩游戏
 */
@property (weak, nonatomic) IBOutlet UIButton *playGame;
/**
 *  交流
 */
@property (weak, nonatomic) IBOutlet UIButton *commit;
/**
 *  活动预定
 */
@property (weak, nonatomic) IBOutlet UIButton *activityOrder;
/**
 *  底部照片
 */
@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;

@end

@implementation RYInterrationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //配置子试图
    [self setupSubViews];
    //配置导航栏
    [self configNav];
    
}

- (IBAction)IMTalkClick:(UIButton *)sender {
}

- (IBAction)onLineBtnClick:(UIButton *)sender {
    
}
- (IBAction)leaveMsgBtnClick:(UIButton *)sender {
    
}
- (IBAction)addFriendBtnClick:(UIButton *)sender {
    
}

- (IBAction)playGame:(UIButton *)sender {
    
    
}

- (IBAction)commitBtnClick:(UIButton *)sender {
    
}
- (IBAction)activityOrder:(UIButton *)sender {
    
}

- (void)configNav
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImage *back = [UIImage imageNamed:@"return_black"];
    [btn setImage:back forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupSubViews
{
    //顶部滚动条
    self.topFocusView.images = @[
                                 @"dynamic_banner",
                                 @"dynamic_banner",
                                 @"dynamic_banner",
                                 ];
    [self.topFocusView startTimer];
    //即时聊天按钮
    //    [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    UIImage *IMImg = [[UIImage imageNamed:@"interactive_chat"] stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    //    [IMImg ];
    //    UIImage *IMImage = [UIImage resizeImageWithName:@"interactive_chat"];
    [self.IMTalk setBackgroundImage:IMImg forState:(UIControlStateNormal)];
    //在线
    UIImage *onLineImage = [UIImage resizeImageWithName:@"interactive_online"];
    [self.onLine setBackgroundImage:onLineImage forState:(UIControlStateNormal)];
    //留言
    UIImage *leaveMsgImg = [UIImage resizeImageWithName:@"interactive_leave_a_message"];
    [self.leaveMsg setBackgroundImage:leaveMsgImg forState:(UIControlStateNormal)];
    //加友
    UIImage *addFriendImg = [UIImage resizeImageWithName:@"interactive_add_friends"];
    [self.addFriend setBackgroundImage:addFriendImg forState:(UIControlStateNormal)];
    //游戏
    UIImage *playGameImg = [UIImage resizeImageWithName:@"interactive_game_pk"];
    [self.playGame setBackgroundImage:playGameImg forState:(UIControlStateNormal)];
    //交流
    UIImage *commitImg = [UIImage resizeImageWithName:@"interactive_classroom"];
    [self.commit setBackgroundImage:commitImg forState:(UIControlStateNormal)];
    //预定
    UIImage *activityOrderImg = [UIImage resizeImageWithName:@"interactive_activity"];
    [self.activityOrder setBackgroundImage:activityOrderImg forState:(UIControlStateNormal)];
    
}
@end
