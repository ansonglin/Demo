//
//  RYToolBar.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYToolBar.h"
#import "UIImage+resize.h"
#import "RYToolBarPopView.h"

#define kToolBarBtnW  60

//#define kToolBarBtnH  self.height

#define kToolBarBtnY  0


@implementation RYToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //加载子试图
        [self setupSubviews];
//        self.backgroundColor = [UIColor blueColor];
        self.userInteractionEnabled = YES;
        self.image = [UIImage resizeImageWithName:@"dynamic_divider"];
        
    }
    return self;
}

- (void)setupSubviews
{
    //点赞按钮
    NSInteger likeBtnX = 17;
    CGRect likeRect = CGRectMake(likeBtnX, kToolBarBtnY, kToolBarBtnW, kCellToolbarheight);
    RYToolBarBtn *likeBtn = [self setUpBtnWithFrame:likeRect Title:@"赞" image:@"praise" highLightImage:@"praise_se"];
    [likeBtn addTarget:self action:@selector(likeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:likeBtn];
    self.likeBtn = likeBtn;
    //评论按钮
    NSInteger commentBtnX = CGRectGetMaxX(likeRect) + 27;
    CGRect commentRect = CGRectMake(commentBtnX, kToolBarBtnY, kToolBarBtnW, kCellToolbarheight);
    RYToolBarBtn *commentBtn = [self setUpBtnWithFrame:commentRect Title:@"评论" image:@"comments" highLightImage:@"comments_se"];
    
    [commentBtn addTarget:self action:@selector(commentBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:commentBtn];
    self.commentBtn = commentBtn;
    //收藏按钮
    NSInteger collectBtnX = CGRectGetMaxX(commentRect) + 27;
    CGRect collectRect = CGRectMake(collectBtnX, kToolBarBtnY, kToolBarBtnW, kCellToolbarheight);
    RYToolBarBtn *collectBtn = [self setUpBtnWithFrame:collectRect Title:@"收藏" image:@"collection" highLightImage:@"collection_se"];
    [collectBtn addTarget:self action:@selector(collectBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:collectBtn];
    self.collectBtn = collectBtn;
    //更多
    NSInteger moreBtnW = 30;
    NSInteger moreBtnX = self.width - 10
    - moreBtnW;//moreBtnW;
    CGRect moreRect = CGRectMake(moreBtnX, kToolBarBtnY, moreBtnW, kCellToolbarheight);
    RYToolBarBtn *moreBtn = [self setUpBtnWithFrame:moreRect Title:nil image:@"even_more" highLightImage:@"even_more_se"];
    
    [moreBtn addTarget:self action:@selector(moreBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self addSubview:moreBtn];
    self.moreBtn = moreBtn;
}



- (void)likeBtnClick:(UIButton *)likeBtn
{
    likeBtn.selected = !likeBtn.selected;
    NSString *str = likeBtn.titleLabel.text;
    NSString *likeNum = @"0";
    if (str.length >= 3) {
        likeNum = [str substringFromIndex:2];
    }
    
    RYLog(@"%@",likeNum);

}
- (void)commentBtnClick:(UIButton *)commentBtn
{
    commentBtn.selected = !commentBtn.selected;
    NSString *str = commentBtn.titleLabel.text;
    NSString *likeNum = @"0";
    if (str.length >= 3) {
        likeNum = [str substringFromIndex:2];
    }
    RYLog(@"%@",likeNum);
    
}- (void)collectBtnClick:(UIButton *)collectBtn
{
    collectBtn.selected = !collectBtn.selected;
    NSString *str = collectBtn.titleLabel.text;
    NSString *likeNum = @"0";
    if (str.length >= 3) {
        likeNum = [str substringFromIndex:2];
    }
    RYLog(@"%@",likeNum);
    
}- (void)moreBtnClick:(UIButton *)tap
{
    //弹出 popView
    [RYToolBarPopView showInView:self.moreBtn];
}
/**
 *  快速创建一个btn
 */
- (RYToolBarBtn *)setUpBtnWithFrame:(CGRect)frame Title:(NSString *)title image:(NSString *)image highLightImage:(NSString *)highLightImage
{
    RYToolBarBtn *btn = [[RYToolBarBtn alloc] initWithFrame:frame];
    
//    [btn setContentMode:(UIViewContentModeCenter)];
    
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitle:title forState:(UIControlStateHighlighted)];
    
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [btn setImage:[UIImage imageNamed:highLightImage] forState:(UIControlStateHighlighted)];
    
    [btn setImage:[UIImage imageNamed:highLightImage] forState:(UIControlStateSelected)];
    
//    btn.backgroundColor = [UIColor redColor];
    return btn;
}

@end
