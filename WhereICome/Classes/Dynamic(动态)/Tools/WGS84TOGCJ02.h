//
//  WGS84TOGCJ02.h
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//  将WGS 地图坐标 转为国内的GCJ02地图坐标

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface WGS84TOGCJ02 : NSObject

//判断是否已经超出中国范围
+(BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;

//转GCJ-02
+(CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;

@end
