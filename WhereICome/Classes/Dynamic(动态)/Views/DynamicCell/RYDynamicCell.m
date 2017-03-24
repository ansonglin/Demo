//
//  RYDynamicCell.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "NSString+TextSize.h"
#import "RYDynamicCell.h"
#import "RYDynamic.h"
#import "NSString+TextSize.h"
@interface RYDynamicCell ()

@end

@implementation RYDynamicCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *DynamicCellId = @"DynamicCellId";
    RYDynamicCell *cell = [tableView dequeueReusableCellWithIdentifier:DynamicCellId];
    if (cell == nil) {
        cell = [[RYDynamicCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:DynamicCellId];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //顶部信息和正文
        RYTopView * topView = [[RYTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kCellTopViewHeight)];
        [self addSubview:topView];
        self.topView = topView;
        
        //图片
        RYPhotosView *photos = [[RYPhotosView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 0)];
        [self addSubview:photos];
        self.photos = photos;
        //工具条
        RYToolBar *toolBar = [[RYToolBar alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kCellToolbarheight)];
        [self addSubview:toolBar];
        self.toolBar = toolBar;
    }
    return self;
}

- (void)setDynamicFrame:(RYDynamicFrame *)dynamicFrame
{
    _dynamicFrame = dynamicFrame;
    self.topView.frame = dynamicFrame.topViewFrame;
    NSInteger conHeight = self.topView.height - kCellTopViewHeight;
    self.topView.content.height = conHeight;
    
    self.photos.frame = dynamicFrame.photoViewFrame;
    self.toolBar.frame = dynamicFrame.toolBarFrame;
    //取出数据源
    RYDynamic *dynamic = dynamicFrame.dynamic;
    //topView
    NSString *imageURL = dynamic.icon;
    UIImage *image = [UIImage imageNamed:imageURL];
    [self.topView.icon setImage:image];
    
    [self.topView.userName setText:dynamic.name];
//    [self.topView.adress setText:dynamic.adress];
    [self.topView.adress setTitle:dynamic.adress forState:(UIControlStateNormal)];
    [self.topView.adress setTitle:dynamic.adress forState:(UIControlStateHighlighted)];

    //计算地址的size
    CGSize addressSize = [dynamic.adress sizeWithFont:kAdressBtnFont maxSize:CGSizeMake(kAdressBtnW, kAdressBtnH)];

    UIButton *adress = self.topView.adress;
    adress.width = addressSize.width + adress.currentImage.size.width;
//    NSInteger addressBtnEdge = (kAdressBtnW - addressSize.width - adress.currentImage.size.width);
//    self.topView.adress.contentEdgeInsets = UIEdgeInsetsMake(0, -addressBtnEdge, 0, 0);
    
    [self.topView.time setText:dynamic.time];
    NSString *content = dynamic.content;
    [self.topView.content setText:content];
    //照片视图
    self.photos.photosData = dynamic.photos;
    //工具条
    NSString *likeNum = dynamic.like;
    NSString *commentNum = dynamic.comment;
    NSString *collectNum = dynamic.collect;
    NSString *like = [NSString stringWithFormat:@"赞 %@",likeNum];
    NSString *comment = [NSString stringWithFormat:@"评论 %@",commentNum];
    NSString *collect = [NSString stringWithFormat:@"收藏 %@",collectNum];
    [self.toolBar.likeBtn setTitle:like forState:(UIControlStateNormal)];
    [self.toolBar.likeBtn setTitle:like forState:(UIControlStateHighlighted)];

    [self.toolBar.commentBtn setTitle:comment forState:(UIControlStateNormal)];
    [self.toolBar.commentBtn setTitle:comment forState:(UIControlStateHighlighted)];

    [self.toolBar.collectBtn setTitle:collect forState:(UIControlStateNormal)];
    [self.toolBar.collectBtn setTitle:collect forState:(UIControlStateHighlighted)];
    
}
- (void)setFrame:(CGRect)frame
{
    CGRect tempRect = frame;
    tempRect.size.height -= 15;
    [super setFrame:tempRect];
}

@end
