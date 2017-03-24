//
//  RYComposeToolbar.m
//  黑马微博
//
//  Created by apple on 14-7-10.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "RYComposeToolbar.h"

@interface RYComposeToolbar()
@property (nonatomic, weak) UIButton *emotionButton;
@end

@implementation RYComposeToolbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        
        // 添加所有的子控件
        [self addButtonWithIcon:@"camera" highIcon:@"camera" tag:RYComposeToolbarButtonTypeCamera];
        [self addButtonWithIcon:@"photo" highIcon:@"photo" tag:RYComposeToolbarButtonTypePicture];
        [self addButtonWithIcon:@"video" highIcon:@"video" tag:RYComposeToolbarButtonTypeVideo];
//        [self addButtonWithIcon:@"video" highIcon:@"video" tag:RYComposeToolbarButtonTypeMention];
//RYComposeToolbarButtonTypeMention
//        [self addButtonWithIcon:@"compose_trendbutton_background" highIcon:@"compose_trendbutton_background_highlighted" tag:RYComposeToolbarButtonTypeTrend];
        
        self.emotionButton = [self addButtonWithIcon:@"face" highIcon:@"face" tag:RYComposeToolbarButtonTypeEmotion];
    }
    return self;
}

- (void)setShowEmotionButton:(BOOL)showEmotionButton
{
    _showEmotionButton = showEmotionButton;
    if (showEmotionButton) { // 显示表情按钮
        [self.emotionButton setImage:[UIImage imageNamed:@"face"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"face"] forState:UIControlStateHighlighted];
    } else { // 切换为键盘按钮
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background"] forState:UIControlStateNormal];
        [self.emotionButton setImage:[UIImage imageNamed:@"compose_keyboardbutton_background_highlighted"] forState:UIControlStateHighlighted];
    }
}

/**
 *  添加一个按钮
 *
 *  @param icon     默认图标
 *  @param highIcon 高亮图标
 */
- (UIButton *)addButtonWithIcon:(NSString *)icon highIcon:(NSString *)highIcon tag:(RYComposeToolbarButtonType)tag
{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highIcon] forState:UIControlStateHighlighted];
//    button.backgroundColor = [UIColor redColor];
    [self addSubview:button];
    return button;
}

/**
 *  监听按钮点击
 */
- (void)buttonClick:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(composeTool:didClickedButton:)]) {
        [self.delegate composeTool:self didClickedButton:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat buttonW = self.width / count;
    CGFloat buttonH = self.height;
    for (int i = 0; i<count; i++) {
        UIButton *button = self.subviews[i];
//        button.y = 0;
//        button.width = buttonW;
//        button.height = buttonH;
//        button.x = i * buttonW;
        button.frame = CGRectMake(i*buttonW, 0, buttonW, buttonH);
    }
}

@end
