//
//  AudioManager.m
//  WhereICome
//
//  Created by mkq on 15/6/23.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "AudioManager.h"
AudioManager *share = nil;

@implementation AudioManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.musicId = @"-1";
    }
    return self;
}

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (!share) {
            share = [[AudioManager alloc] init];
            share.musicPlayState = MusicPlayStateNone;
        }
    });
    return share;
}
@end
