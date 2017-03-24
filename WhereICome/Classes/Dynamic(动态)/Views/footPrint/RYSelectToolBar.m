//
//  RYSelectToolBar.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYSelectToolBar.h"

@implementation RYSelectToolBar


+ (instancetype)selectToolBar
{
//    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"RYSelectToolBar" owner:self options:nil];
//    RYLog(@"%@",arr);
    
    return [[[NSBundle mainBundle] loadNibNamed:@"RYSelectToolBar" owner:self options:nil] firstObject];
}

- (void)awakeFromNib
{
    //做一些属性配置
    [super awakeFromNib];
//    self.backgroundColor = [UIColor orangeColor];
    self.faceBtn.backgroundColor = [UIColor orangeColor
                                    ];
}
@end
