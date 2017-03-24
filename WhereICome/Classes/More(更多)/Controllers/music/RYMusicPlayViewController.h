//
//  RYMusicPlayViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AudioStreamer.h"
#import "MusicModel.h"
#import "AudioManager.h"

typedef NS_ENUM(NSInteger, PlayModel) {
    isOrder, // 顺序播放
    isRandom, // 随机播放
    isCycle, // 循环播放
    isSingle // 单曲循环
};

@interface RYMusicPlayViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *musicArray;// 歌曲数组

@property (nonatomic, copy)NSString *mid;// 歌曲标记
@property (nonatomic, strong)UIButton * playButton;// 播放按钮
@property (nonatomic) MusicPlayState musicPlayState;
@property (nonatomic) PlayModel playModel;
#warning 正在播放歌曲的位置
@property (nonatomic, assign)NSInteger playingIndex;
// 播放进度按钮的定时器
@property (nonatomic, strong)NSTimer *progressUpdateTimer;
// 播放进度条
@property (nonatomic, strong)UISlider *progressSlider;
// 音量进度条
@property (nonatomic, strong)UISlider *soundSlider;

@property (nonatomic, strong) MusicModel *music;

@property (nonatomic, strong) UILabel *labelTimePlay;// 已播放时间
@property (nonatomic, strong) UILabel *labelAllTime;// 歌曲时长


@property (nonatomic, strong) UIButton *buttonCycle;// 循环按钮
@property (nonatomic, strong) UIView *musicModeView;// 音乐播放模式提示图
@property (nonatomic, strong) UILabel *musicModeLabel;// 音乐播放模式提示文字框
@property (nonatomic) BOOL isClickPlayMode;// 判断改变播放模式按钮是否被点击过

@property (nonatomic, strong) UIImageView *imgView;// 旋转图片

@property (nonatomic, strong) UIImageView *bigImage;// 背景大图片

@property (nonatomic, strong) UITableView *tableView;// 歌词界面

@property (nonatomic, strong) NSString *imageName;

@end
