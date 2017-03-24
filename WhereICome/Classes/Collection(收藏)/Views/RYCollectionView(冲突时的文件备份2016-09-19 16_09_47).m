//
//  RYCollectionView.m
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCollectionView.h"

// UICollectionView的item宽度
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 40) / 3
#define ITEMS_HIGHT1 ([UIScreen mainScreen].bounds.size.height - 221) / 4

@implementation RYCollectionView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        // 设置layout
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(ITEMS_WIDTH1, ITEMS_HIGHT1);
        flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
#pragma mark 设置UICollectionViewFlowLayout的header来放置广告
        flow.headerReferenceSize = CGSizeMake(kScreenW, 58);

        // 创建UICollectionView
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 49) collectionViewLayout:flow];
        _collectionView.delegate = delegate;
        _collectionView.dataSource = delegate;
        _collectionView.bounces = NO;
//        [_collectionView setScrollEnabled:NO];
        self.collectionView.backgroundColor = [UIColor whiteColor];
        

        // 可滑动高度提示
//        self.collectionView.showsVerticalScrollIndicator = NO;
        [self addSubview:_collectionView];
    }
    return self;
}

@end
