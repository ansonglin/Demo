//
//  RYPsychologyView.h
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYPsychologyView : UIView

@property (nonatomic, strong) UICollectionView *collection;

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate;

@end
