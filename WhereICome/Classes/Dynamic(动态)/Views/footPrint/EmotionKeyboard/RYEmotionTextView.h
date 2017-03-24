//
//  RYEmotionTextView.h
//  WhereICome
//
//  Created by mkq on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYTextView.h"
@class RYEmotion;

@interface RYEmotionTextView : RYTextView
/**
 *  拼接表情到最后面
 */
- (void)appendEmotion:(RYEmotion *)emotion;

/**
 *  具体的文字内容
 */
- (NSString *)realText;

@end
