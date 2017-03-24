//
//  Singleton.h
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RYMusicPlayViewController.h"
@class AudioStreamer;

@interface AudioManager : NSObject
// 歌曲标记
@property (nonatomic, copy) NSString * musicId;

@property (nonatomic, strong) AudioStreamer *audioPlayer;
@property (nonatomic) MusicPlayState musicPlayState;

+ (instancetype)shareInstance;

@end
