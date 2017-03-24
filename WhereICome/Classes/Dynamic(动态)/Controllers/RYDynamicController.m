//
//  RYDynamicController.m
//  WhereICome
//
//  Created by mkq on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYDynamicController.h"
#import "RYDynamicCell.h"
#import "RYDynamic.h"
#import "RYDynamicFrame.h"
#import "FocusView.h"
#import "RYMeViewController.h"
#import "RYDetailController.h"
#import "RYInterrationController.h"
#import "RYFootPrintController.h"
@interface RYDynamicController ()
/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray *datas;

@end



@implementation RYDynamicController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //配置tableView
    [self configTableView];
    //我 的标题配置
    [self setupTitleBtn];
    //左按钮
    [self setupLeftBtn];
    //右按钮
    [self setupRightBtn];
    
}
/**
 *  左按钮
 */
- (void)setupLeftBtn
{
    CGRect rect = CGRectMake(0, 0, 50, 44);
    UIButton *btn = [self setupBtnWithTitle:@"足迹" withSel:@selector(leftBtnClick:) frame:rect];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  左按钮
 */
- (void)setupRightBtn
{
    CGRect rect = CGRectMake(0, 0, 50, 44);
    UIButton *btn = [self setupBtnWithTitle:@"互动" withSel:@selector(RightBtnClick:) frame:rect];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  配置 我 的标题按钮
 */
- (void)setupTitleBtn
{
    UIButton *title = [self setupBtnWithTitle:@"我" withSel:@selector(meClick:) frame:CGRectZero];
    self.navigationItem.titleView = title;
}
/**
 *  我 点击
 */
- (void)meClick:(UIButton *)me
{
    RYMeViewController *meVc = [[RYMeViewController alloc] init];
    [self.navigationController pushViewController:meVc animated:YES];
}
- (void)leftBtnClick:(UIButton *)leftBtn
{
    RYFootPrintController *footprint = [[RYFootPrintController alloc] init];
    [self.navigationController pushViewController:footprint animated:YES];
}
- (void)RightBtnClick:(UIButton *)leftBtn
{
    RYInterrationController *footprint = [[RYInterrationController alloc] initWithNibName:@"RYInterrationController" bundle:nil];
    [self.navigationController pushViewController:footprint animated:YES];
}
/**
 *  快速创建一个Btn
 */
- (UIButton *)setupBtnWithTitle:(NSString *)title withSel:(SEL)action frame:(CGRect)frame
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:(UIControlStateNormal)];
    [btn setTitle:title forState:(UIControlStateHighlighted)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateHighlighted)];
    [btn addTarget:self action:action forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}
/**
 *  配置tableView
 */
- (void)configTableView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = RYColor(237, 237, 237);
}

#pragma mark UITableView代理和数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYDynamicCell *cell = [RYDynamicCell cellWithTableView:tableView];
    //数据的配置
    cell.dynamicFrame = [self.datas objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    RYDynamicFrame *dynamicFrame = [self.datas objectAtIndex:indexPath.row];
    
    RYDetailController *detailVc = [[RYDetailController alloc] initWithStyle:(UITableViewStylePlain)];
    detailVc.dynamicFrame = dynamicFrame;
    
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYDynamicFrame *dynamicFrame = [self.datas objectAtIndex:indexPath.row];
    return dynamicFrame.cellheight + 15;
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSArray *arr = @[
                     @"dynamic_banner",
                     @"dynamic_banner",
                     @"dynamic_banner"
                     ];
    FocusView *headerView = [[FocusView alloc] initWithFrame:CGRectZero Images:arr];
    [headerView startTimer];
    
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
*/
#pragma mark  懒加载
- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
        NSMutableArray *tempArr = [NSMutableArray array];
        NSDictionary *dict = @{
                               @"icon":@"person_default_icon",
                               @"name":@"lamMe",
                               @"time":@"今天11:23",
                               @"adress":@"北京 朝阳区",
                               @"content":@"我和猫咪的合照",
                               @"photos":@[@"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           @"dynamic_picture_a",
                                           ],
                               @"like":@"1",
                               @"comment":@"2",
                               @"collect":@"3",
                               };
        NSDictionary *dict1 = @{
                               @"icon":@"person_icon",
                               @"name":@"清微小竹",
                               @"time":@"今天11:23",
                               @"adress":@"河南 郑州",
                               @"content":@"最贵的东西不一定就是适合我的需要,最合适我的不一定是最贵的,我就是这么萌!!",
                               @"photos":@[],
                               @"like":@"1",
                               @"comment":@"2",
                               @"collect":@"3",
                               };
        NSDictionary *dict2 = @{
                               @"icon":@"Head",
                               @"name":@"烛光",
                               @"time":@"今天11:23",
                               @"adress":@"上海 普陀区",
                               @"content":@"我亲爱的小伙伴",
                               @"photos":@[
                                       @"dynamic_picture_c.jpg",
                                               @"dynamic_picture_b",
                                       ],
                               @"like":@"1",
                               @"comment":@"2",
                               @"collect":@"3",
                               };
        NSDictionary *dict3 = @{
                                @"icon":@"Persion_Image",
                                @"name":@"小花",
                                @"time":@"今天11:23",
                                @"adress":@"在浙江 温州",
                                @"content":@"我的宠物狗",
                                @"photos":@[
                                        @"dynamic_picture_d",],
                                @"like":@"1",
                                @"comment":@"2",
                                @"collect":@"3",
                                };
//        NSDictionary *dict4 = @{
//                                @"icon":@"Head",
//                                @"name":@"小明",
//                                @"time":@"今天11:23",
//                                @"adress":@"上海 虹口区",
//                                @"content":@"快乐的一天",
//                                @"photos":@[
//                                        @"dynamic_picture_a",
//                                        @"dynamic_picture_b",
//                                            ],
//                                @"like":@"1",
//                                @"comment":@"2",
//                                @"collect":@"3",
//                                };
        [tempArr addObject:dict];
        [tempArr addObject:dict1];
        [tempArr addObject:dict2];
        [tempArr addObject:dict3];
        for (NSDictionary *dict in tempArr) {
            RYDynamic *dynamic = [RYDynamic dynamicWithDict:dict];
            RYDynamicFrame *frameDynimic = [[RYDynamicFrame alloc] init];
            frameDynimic.dynamic = dynamic;
            
            [_datas addObject:frameDynimic];
        }
    }
    return _datas;
}

@end
