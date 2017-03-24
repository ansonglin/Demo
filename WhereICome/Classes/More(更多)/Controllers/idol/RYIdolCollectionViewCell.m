//
//  RYIdolCollectionViewCell.m
//  WhereICome
//
//  Created by 安松林 on 15/7/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYIdolCollectionViewCell.h"

@implementation RYIdolCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
        self.imageView.layer.borderWidth = 5;
        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.cornerRadius = 5;
        self.imageView.clipsToBounds = YES;
        [self addSubview:_imageView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.width + 5, self.frame.size.width, self.frame.size.height -self.frame.size.width - 5)];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.numberOfLines = 0;
        _label.textColor = [UIColor whiteColor];
        [self addSubview:_label];
        
    }
    return self;
}

- (void)setImage:(NSString *)image
{
    _image = [image copy];
    
    self.imageView.image = [UIImage imageNamed:image];
}

@end
