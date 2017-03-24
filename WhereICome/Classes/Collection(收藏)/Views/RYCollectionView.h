//
//  RYCollectionView.h
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RYCollectionView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;


// RYCollectionView的初始化方法
- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate;


@end
