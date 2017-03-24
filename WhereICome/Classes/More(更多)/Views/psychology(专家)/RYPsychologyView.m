

//
//  RYPsychologyView.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPsychologyView.h"

// UICollectionView的item宽度
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 42) / 3
#define ITEMS_HIGHT1 ITEMS_WIDTH1

@implementation RYPsychologyView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        // 设置layout
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(ITEMS_WIDTH1, ITEMS_HIGHT1);
        flow.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

        // 创建UICollectionView
        self.collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:flow];
        _collection.delegate = delegate;
        _collection.dataSource = delegate;
        self.collection.backgroundColor = [UIColor whiteColor];
        [self addSubview:_collection];
    }
    return self;
}

@end
