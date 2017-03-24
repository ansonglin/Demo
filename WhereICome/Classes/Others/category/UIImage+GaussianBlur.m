//
//  UIImage+GaussianBlur.m
//  图像模糊
//
//  Created by liuchang on 15/1/4.
//  Copyright (c) 2015年 liuchang. All rights reserved.
//

#import "UIImage+GaussianBlur.h"
#import "UIImageView+WebCache.h"
@implementation UIImage (GaussianBlur)

+ (UIImage *)imageWithBlurImageNamed:(UIImage *)theImage intputRadius:(CGFloat)radius
{
    // 创建基于GPU的CIContext对象
    // 创建CIImage，用需要处理的图片
    CIContext *context = [CIContext contextWithOptions:nil];
    // 创建CIImage，用需要处理的图片
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    // 创建CIFilter，具体实施渲染
    // 指定过滤镜，这里是一个高斯模糊过滤镜
    CIFilter *blurFilter1 = [CIFilter filterWithName:@"CIGaussianBlur"];
    // filter是按照名字来创建的CIGaussianBlur不能更改
    // 指定需要过滤的图片
    [blurFilter1 setValue:inputImage forKey:kCIInputImageKey];
    // 指定过滤镜的参数，不同的过滤镜参数也不一样
    // 修改radius可以更改模糊程度
    [blurFilter1 setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    // 处理后的图片返回
    CIImage *result = [blurFilter1 valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    // 即使使用ARC也要加上这个release，因为ARC不管理CGImageRef，不释放会内存泄露
    return returnImage;
}
/*-------------------------------------------------------------*/
+ (UIImage *)imageWithBlurImage:(NSURL *)url intputRadius:(CGFloat)radius
{
    UIImageView *imgView = [[UIImageView alloc] init];
//    [imgView setImageWithURL:url];
    imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:imgView.image.CGImage];
    CIFilter *blurFilter1 = [CIFilter filterWithName:@"CIGaussianBlur"];
    // filter是按照名字来创建的CIGaussianBlur不能更改
    [blurFilter1 setValue:inputImage forKey:kCIInputImageKey];
    [blurFilter1 setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    // 修改radius可以更改模糊程度
    CIImage *result = [blurFilter1 valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    // 即使使用ARC也要加上这个release，因为ARC不管理CGImageRef，不释放会内存泄露
    return returnImage;
}
/*-----------------------------------------------------------------*/

@end
