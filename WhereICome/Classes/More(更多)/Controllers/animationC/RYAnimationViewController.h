//
//  RYAnimationViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface RYAnimationViewController : UIViewController
{
    MPMoviePlayerController *mp;
    UIActivityIndicatorView *loading;
    UILabel *label;
}

// 视频的接口
@property (nonatomic, retain) NSURL *movieUrl;
// 视频播放的方法
- (void)readyPlayer;

@end
