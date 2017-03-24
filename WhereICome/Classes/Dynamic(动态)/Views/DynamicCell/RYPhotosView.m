//
//  RYPhotosView.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.


#import "RYPhotosView.h"

@interface RYPhotosView ()
/**
 *  所有的图片
 */
@property (nonatomic, strong)NSMutableArray *photos;

@end

@implementation RYPhotosView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //添加6个图片视图
        for (int i = 0; i < kMaxImageCount; i++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kimageViewW, kimageViewH)];
            imageView.hidden = YES;
            
            [self addSubview:imageView];
            [self.photos addObject:imageView];
        }
    }
    return self;
}


- (void)setPhotosData:(NSArray *)photos
{
//    self.backgroundColor = [UIColor grayColor];
    //没有图片需要显示
    if(photos == nil || photos.count == 0) {
        self.hidden = YES;
        self.photosViewHeight = 0;
        return;
    }else{
        self.hidden = NO;
    }
    _photosData = photos;
//    int i = 0;
    //显示需要的照片视图
    for (int i = 0; i < _photosData.count; i++) {
        
        UIImageView *imageView = [self.photos objectAtIndex:i];
        imageView.hidden = NO;
        NSString *file = [[self.photosData objectAtIndex:i] stringByAppendingString:@".jpg"];
        UIImage *image = [UIImage imageNamed:file];
        imageView.image = image;
    }
    //隐藏不需要显示的照片视图
    for (NSInteger j = _photosData.count; j < self.photos.count; j++) {
        UIImageView *imageView = [self.photos objectAtIndex:j];
        imageView.hidden = YES;
    }
    //确定该视图的高度
    if(_photosData.count > 0 && _photosData.count <= kimageViewRowCount){//<= 3张图片
        self.photosViewHeight = kimageViewH;
    }else if (_photosData.count > kimageViewRowCount){//大于3张图片
        self.photosViewHeight = 2*kimageViewH + kimageViewPadding;
    }
    //根据数据确定图片视图的大小
    self.height = self.photosViewHeight;
    //
    [self setNeedsDisplay];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    NSInteger imageViewX = 10;
    
    for (int i = 0; i <  self.photosData.count; i++) {
        NSInteger imageViewX = (i % kimageViewRowCount) * (kimageViewW + 2) + 10;
        NSInteger imageViewY = (i / kimageViewRowCount) *(kimageViewH + 2);
        UIImageView *imageView = [self.photos objectAtIndex:i];
        if (imageView) {
            imageView.frame = CGRectMake(imageViewX, imageViewY, kimageViewW, kimageViewH);
        }
    }
}

#pragma mark 懒加载
-(NSMutableArray *)photos
{
    if (_photos == nil) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
