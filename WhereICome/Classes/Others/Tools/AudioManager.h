//
//  AudioManager.h
//  WhereICome
//
//  Created by mkq on 15/6/23.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "RYMusicPlayViewController.h"

typedef NS_ENUM(NSInteger, MusicPlayState) {
    // 其他音乐正在播放
    MusicPlayStateOtherPlaying,
    // 未有音乐在播放
    MusicPlayStateNone,
    // 音乐开始播放
    MusicPlayStateStart,
    // 音乐暂停播放
    MusicPlayStatePause,
};

@class AudioStreamer;

@interface AudioManager : NSObject
// 歌曲标记
@property (nonatomic, copy) NSString * musicId;

@property (nonatomic, strong) AudioStreamer *audioPlayer;
@property (nonatomic) MusicPlayState musicPlayState;

+ (instancetype)shareInstance;

@end
