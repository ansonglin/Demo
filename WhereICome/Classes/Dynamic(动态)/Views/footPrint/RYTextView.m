//
//  RYTextView.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define kPlaceHolderMarginTop   10
#define kPlaceHolderMarginLeft   10

#import "RYTextView.h"

@interface RYTextView ()

@property (nonatomic, weak) UILabel *placeholderLabel;

@end

@implementation RYTextView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 1.添加提示文字
        UILabel *placeholderLabel = [[UILabel alloc] init];
        placeholderLabel.textColor = [UIColor lightGrayColor];
        placeholderLabel.hidden = YES;
        placeholderLabel.numberOfLines = 0;
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.font = self.font;
        [self insertSubview:placeholderLabel atIndex:0];
        self.placeholderLabel = placeholderLabel;
        
        // 2.监听textView文字改变的通知
        [RYNotificationCenter addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    self.placeholderLabel.text = placeholder;
    if (placeholder.length) { // 需要显示
        self.placeholderLabel.hidden = NO;
        
        // 计算frame
        CGFloat placeholderX = kPlaceHolderMarginLeft;
        CGFloat placeholderY = kPlaceHolderMarginTop;
        CGFloat maxW = self.frame.size.width - 2 * placeholderX;
        CGFloat maxH = self.frame.size.height - 2 * placeholderY;
        CGSize placeholderSize = [placeholder sizeWithFont:self.placeholderLabel.font constrainedToSize:CGSizeMake(maxW, maxH)];
        self.placeholderLabel.frame = CGRectMake(placeholderX, placeholderY, placeholderSize.width, placeholderSize.height);
    } else {
        self.placeholderLabel.hidden = YES;
    }
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    self.placeholderLabel.textColor = placeholderColor;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeholderLabel.font = font;
    self.placeholder = self.placeholder;
}

- (void)textDidChange
{
    self.placeholderLabel.hidden = (self.text.length != 0);
}

- (void)dealloc
{
    [RYNotificationCenter removeObserver:self];
}

@end
