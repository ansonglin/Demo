//
//  RYDynamicFrame.m
//  WhereICome
//
//  Created by mkq on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYDynamicFrame.h"
#import "RYDynamic.h"
#import "NSString+TextSize.h"
#import "RYToolBar.h"
#import "RYPhotosView.h"

#define kCellTopViewHeight 80
//#define kCellToolbarheight 50

@implementation RYDynamicFrame

- (void)setDynamic:(RYDynamic *)dynamic
{
    _dynamic = dynamic;
    
    //1 topView 的frame
    //计算正文文字多占的size
    NSInteger topViewX = 0;
    NSInteger topViewY = 0;
    NSInteger topViewW = kScreenW;
    CGSize contentSize = [dynamic.content sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(topViewW-5, MAXFLOAT)];
    NSInteger topViewH = contentSize.height + kCellTopViewHeight+20;//加20的原因是所有的空间向下偏移了16
    self.topViewFrame = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    //2 照片视图 的 frame
    NSInteger photosViewH = 0;
    if(dynamic.photos.count > 0 && dynamic.photos.count <= kimageViewRowCount){//<= 3张图片
        photosViewH = kimageViewH;
    }else if (dynamic.photos.count > kimageViewRowCount){//大于3张图片
        photosViewH = 2*kimageViewH + kimageViewPadding;
    }
    NSInteger photosViewW = kScreenW;
    NSInteger photosViewX = 0;
    NSInteger photosViewY = CGRectGetMaxY(self.topViewFrame);
    self.photoViewFrame = CGRectMake(photosViewX, photosViewY, photosViewW, photosViewH);
    
    //3 工具条的frame
    NSInteger toolBarX = 0;
    NSInteger toolBarY = CGRectGetMaxY(self.photoViewFrame)+2;
    NSInteger toolBarH = kCellToolbarheight;
    NSInteger toolBarW = kScreenW;
    self.toolBarFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    //计算出cell的高度
    self.cellheight = CGRectGetMaxY(self.toolBarFrame);
    
}
@end
