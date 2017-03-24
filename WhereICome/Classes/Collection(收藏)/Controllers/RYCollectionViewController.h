//
//  RYCollectionViewController.h
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYCollectionView.h"
@class CollectionReusableView;

@interface RYCollectionViewController : UIViewController

@property (nonatomic, strong) RYCollectionView *myView;
/**
 *  图片数组   title数组
 */
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;

//@property (nonatomic, strong) CollectionReusableView *reusableView;

@end
