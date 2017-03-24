//
//  RYToolBar.h
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define kCellToolbarheight 50

#import <UIKit/UIKit.h>
#import "RYToolBarBtn.h"

@interface RYToolBar : UIImageView
/**
 *  点赞按钮
 */
@property (nonatomic, weak)RYToolBarBtn *likeBtn;
/**
 *  评论按钮
 */

@property (nonatomic, weak)RYToolBarBtn *commentBtn;
/**
 *  收藏按钮
 */
@property (nonatomic, weak)RYToolBarBtn *collectBtn;
/**
 *  更多按钮
 */
@property (nonatomic, weak)RYToolBarBtn *moreBtn;

@end
