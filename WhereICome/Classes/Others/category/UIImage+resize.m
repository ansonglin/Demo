//
//  UIImage+resize.m
//  WhereICome
//
//  Created by mkq on 15/5/26.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "UIImage+resize.h"

@implementation UIImage (resize)

+ (UIImage *)resizeImageWithName:(NSString *)imageName
{
    UIImage *image = [self imageNamed:imageName];
    
    if (image == nil) {
        RYLog(@"%@\n图片创建失败,请检查图片的资源路径\n",self);
    }
    
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
}
@end
