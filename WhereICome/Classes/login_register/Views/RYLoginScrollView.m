//
//  RYLoginScrollView.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYLoginScrollView.h"

@implementation RYLoginScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeNone) {
//        RYLog(@"======");
        if ([self.loginViewDetegate respondsToSelector:@selector(LoginScrollView:clicked:)]) {
            [self.loginViewDetegate LoginScrollView:self clicked:event];
        }
    }
    [super touchesBegan:touches withEvent:event];
}

@end
