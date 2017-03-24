//
//  RYSelectToolBar.h
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  视频 照片 笑脸 选择工具条

#import <UIKit/UIKit.h>

@interface RYSelectToolBar : UIView

+ (instancetype)selectToolBar;

@property (weak, nonatomic) IBOutlet UIButton *cameraBtn;

@property (weak, nonatomic) IBOutlet UIButton *videoBtn;

@property (weak, nonatomic) IBOutlet UIButton *faceBtn;
@end
