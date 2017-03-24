//
//  RYLocationController.m
//  WhereICome
//
//  Created by mkq on 15/6/8.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYLocationController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "JZLocationConverter.h"
#import "RYAnnotion.h"
#import "RYAnnotationView.h"
#import "RYLocation.h"
#import "WGS84TOGCJ02.h"
@interface RYLocationController ()<MKMapViewDelegate,CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>

/**
 *  定位
 */
@property (nonatomic, strong)CLLocationManager *locationMgr;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
/**
 *  反向地理编码
 */
@property (nonatomic, strong)CLGeocoder *geocoder;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 *  tableView 的数据源
 */
@property (nonatomic, strong)NSMutableArray *datas;

@property (nonatomic, copy)NSString *detailAddress;


@end

@implementation RYLocationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNav];
    [self setupLocation];
    [self configMapView];
    [self configTableView];
    
}

- (void)configTableView
{
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)configNav
{
    //左按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [btn setImage:[UIImage imageNamed:@"return_black"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //titleView
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    [titleView setText:@"我的位置"];
    //    [titleView setFont:[UIFont systemFontOfSize:15]];
    self.navigationItem.titleView = titleView;
}

- (void)configMapView
{
    // 显示用户的位置（一颗发光的蓝色大头针）
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.mapView.showsUserLocation = YES;
    
    //上海虹口区的经纬度 121.5 31.27
    //创建区域
//    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(31.27, 121.5);
//    [self scrollMapViewWithCenter:center];
}

/**
 *  设置定位信息
 */
- (void)setupLocation
{
    _locationMgr = [[CLLocationManager alloc] init];
    _locationMgr.delegate = self;
    //向用户请求权限，NSLocationWhenInUseUsageDescription必须要添加到info.plist
    if (iOSEdition >= 8.0) {
        [self.locationMgr requestWhenInUseAuthorization];
    }
    //设置精确度
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    //设置更新频率，当移动距离超过20m的时候，返回新的点
    [self.locationMgr setDistanceFilter:20];
    if ([CLLocationManager locationServicesEnabled]){
        [self.locationMgr startUpdatingLocation];
    }
}

#pragma mark MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    //创建区域
    CLLocationCoordinate2D center = userLocation.location.coordinate;
    [self scrollMapViewWithCenter:center];
    // 获得城市名称
    [self.geocoder reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        if (placemarks.count == 0) return;
        
        CLPlacemark *placemark = [placemarks firstObject];
        
        self.detailAddress = [self detailAdressFromPlaceMark:placemark];
        
        RYAnnotion *annotation = [[RYAnnotion alloc] init];
        annotation.coordinate  = userLocation.coordinate;
        annotation.title = @"我的位置";
        annotation.subtitle = self.detailAddress;
        
        [self.mapView addAnnotation:annotation];
        
        // 定位到城市，就发送请求
        [self mapView:self.mapView regionDidChangeAnimated:YES];
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[RYAnnotion class]]){
        
        static NSString *annotationId = @"annotaionId";
        MKPinAnnotationView *anotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationId];
        if (anotationView == nil) {
            anotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationId];
            anotationView.canShowCallout = YES;
            anotationView.animatesDrop = YES;
        }
        
        [anotationView setImage:[UIImage imageNamed:@"Create_group"]];
        
        return anotationView;
    }
    
    return nil;
}

/**
 *  地图显示的区域发生改变了
 */
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    if (self.detailAddress == nil) return;
    RYLog(@"%@",self.detailAddress);
}
/**
 *  根据给定的placemark  得出具体的地址
 */
- (NSString *)detailAdressFromPlaceMark:(CLPlacemark *)placemark
{
    NSDictionary *dict = placemark.addressDictionary;
    //地点的名字
//    NSString *name = dict[@"Name"];
    //XX 市
    NSString *city = dict[@"State"];
    //XX 区
    NSString *zone = dict[@"SubLocality"];
    //XX 路
    NSString *street = dict[@"Street"];
    // 国家
//    NSString *country = dict[@"Country"];
    NSString *detailAddress = @"";
    detailAddress = street;//[[city stringByAppendingString:zone ? zone : @""] stringByAppendingString:street ? street : @""];//;[country stringByAppendingString:[[[city stringByAppendingString:zone] stringByAppendingString:street] stringByAppendingString:name]];
#pragma mark  tableView 更新数据源
    //tableView 更新
//    RYLocation *locName = [RYLocation locationWithLocation:name];
//    RYLocation *locStreet = [RYLocation locationWithLocation:street];
    RYLocation *locCity = [RYLocation locationWithLocation:city];
    RYLocation *locZone = [RYLocation locationWithLocation:zone];
    RYLocation *locStreet = [RYLocation locationWithLocation:street];
    //清空数据源
    [self.datas removeAllObjects];
    
//    if (nil != locName) {
//        [self.datas addObject:locName];
//    }
    if (nil != street) {
        [self.datas addObject:locStreet];
    }

    if (nil != locCity) {
        [self.datas addObject:locCity];
    }
    if (nil != locZone) {
        [self.datas addObject:locZone];
    }
    
    [self.tableView reloadData];
    return detailAddress;
    
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
//    RYLog(@"locations-->\n%@,",locations);
    CLLocation *userLocation = [locations firstObject];
    [self scrollMapViewWithCenter:userLocation.coordinate];
}
/**
 *  将mapview 滚动到指定的位置
 */
- (void)scrollMapViewWithCenter:(CLLocationCoordinate2D)center
{
    MKCoordinateSpan span = MKCoordinateSpanMake(0.05, 0.05);
    //转为火星坐标（中国用的坐标系统）
    CLLocationCoordinate2D coord = [JZLocationConverter wgs84ToGcj02:center];
//    RYLog(@"%@",coord);
//    CLLocationCoordinate2D coord2 = [WGS84TOGCJ02 transformFromWGSToGCJ:center];
    MKCoordinateRegion region = MKCoordinateRegionMake(coord, span);
    [self.mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            if ([self.locationMgr respondsToSelector:@selector(requestAlwaysAuthorization)])
            {
                [self.locationMgr requestWhenInUseAuthorization];
            }
            break;
        default:
            break;
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    RYLog(@"定位失败\n%@",error);
}
#pragma mark tableView 数据源和代理对象
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"locationCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:cellID];
        [cell.textLabel sizeToFit];
    }
    RYLocation *loc = [self.datas objectAtIndex:indexPath.row];
    
    NSString *addressText = loc.location;
    
    cell.textLabel.text = addressText;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RYLocation *location = [self.datas objectAtIndex:indexPath.row];
    //将用户选择的地址信息回传
    if ([self.delegate respondsToSelector:@selector(locationController:withLoctionString:)]) {
        
        [self.delegate locationController:self withLoctionString:location.location];
    }
    [self back];
}

#pragma mark 懒加载

- (CLGeocoder *)geocoder
{
    if (_geocoder == nil) {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
    }
    
    return _datas;
}


- (void)dealloc
{
    self.mapView = nil;
    self.locationMgr = nil;
    self.geocoder = nil;
    RYLog(@"locationVc dealloc");
}

- (void)back
{
//    [UIView animateWithDuration:0.5 animations:^{
//        self.view.y = kScreenH;
//    } completion:^(BOOL finished) {
        [self.navigationController popViewControllerAnimated:YES];
//    }];
}


@end
