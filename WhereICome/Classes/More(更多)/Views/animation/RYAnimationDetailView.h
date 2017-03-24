//
//  RYAnimationDetailView.h
//  WhereICome
//
//  Created by 安松林 on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface RYAnimationDetailView : UIView

// 动画片详情
@property (nonatomic, strong) UILabel *content;
// 视频播放界面
@property (nonatomic, strong) MPMoviePlayerController *mp;
// 视频最大化按钮
@property (nonatomic, strong) UIButton *full;
// 音量按钮
@property (nonatomic, strong) UIButton *play;

@property (nonatomic, strong) UIButton *collect;



@end
