//
//  RYCollectionDetailVC.h
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYBookModel.h"
#import "RYBookDetailView.h"

@interface RYBookDetailVC : UIViewController
// model传值
@property (nonatomic, strong) RYBookModel *model;

@property (nonatomic, strong) RYBookDetailView *myView;

@end
