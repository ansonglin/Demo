//
//  RYAnnotion.h
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>
@interface RYAnnotion : NSObject<MKAnnotation>

@property (nonatomic)CLLocationCoordinate2D coordinate;

@property (nonatomic, copy)NSString *title;

@property (nonatomic, copy)NSString *subtitle;

@end
