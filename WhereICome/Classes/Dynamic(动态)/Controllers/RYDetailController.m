//
//  RYDetailController.m
//  WhereICome
//
//  Created by mkq on 15/6/1.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#define kCellSectionH   60

#import "RYDetailController.h"
#import "RYDynamicCell.h"
#import "RYDynamicFrame.h"
#import "NSAttributedString+colorAndFont.h"
#import "RYDetailCell.h"
#import "RYDetailFrame.h"
#import "RYToolBar.h"
#import "UIImage+resize.h"
#import "RYDetailIconsView.h"

@interface RYDetailController ()
/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation RYDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    //配置导航栏
    [self configNav];
    //配置TableView
    [self configTabView];
    
}

- (void)configNav
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"return_black"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}
/**
 *  返回
 */
- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configTabView
{
//    CGRect footViewRect = CGRectMake(0, 0, kScreenW, 50);
//    self.tableView.tableFooterView = [[RYToolBar alloc] initWithFrame:footViewRect];
}

- (void)setDynamicFrame:(RYDynamicFrame *)dynamicFrame
{
    _dynamicFrame =dynamicFrame;
//    创建headerView
    UIView *headerView = [[UIView alloc] init];
    
    //cell
    RYDynamicCell *dynamicCell = [[RYDynamicCell alloc] init];
    dynamicCell.dynamicFrame = dynamicFrame;
    NSInteger headerViewH = dynamicFrame.cellheight - kCellToolbarheight;
    if (!dynamicCell.photos.hidden) {//有图片的滑 设置间隔
        headerViewH += 10;
    }
    //隐藏工具栏
    dynamicCell.toolBar.hidden = YES;
    [headerView addSubview:dynamicCell];
    //图片
    NSInteger iconsH = 60;
    CGRect iconsRect = CGRectMake(0, headerViewH, kScreenW, iconsH);
    RYDetailIconsView *icons = [[RYDetailIconsView alloc] initWithFrame:iconsRect];
    icons.icons = @[
                    @"person_icon",
                    @"Persion_Image",
                    @"Head",
                    @"person_default_icon",
                    @"Head",
                    ];
    [headerView addSubview:icons];
    
    headerView.size = CGSizeMake(kScreenW, headerViewH + iconsH);
    self.tableView.tableHeaderView = headerView;
}


#pragma mark TableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYDetailCell *cell = [RYDetailCell cellWithTableView:tableView];
    RYDetailFrame *detailFrame = [self.datas objectAtIndex:indexPath.row];
    
    cell.detailFrame = detailFrame;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *header = [[UIView alloc] init];
//    header.backgroundColor = RYColor(203, 203, 203);
    UILabel *commentNums = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, kScreenW, kCellSectionH-1)];
    [header addSubview:commentNums];
    commentNums.backgroundColor = [UIColor whiteColor];
    NSString *str1 = @"最新评论";
    NSString *str2 = @"(共有30条最新评论)";

    NSMutableAttributedString *attStr1 = [NSMutableAttributedString attributedStringWithString:str1 Color:[UIColor blackColor] font:[UIFont boldSystemFontOfSize:15]];
    NSMutableAttributedString *attStr2 = [NSMutableAttributedString attributedStringWithString:str2 Color:RYColorFromRGB(0xa5a5a5) font:[UIFont systemFontOfSize:14]];
    [attStr1 appendAttributedString:attStr2];
    [commentNums setAttributedText:attStr1];
    
    //添加分割线divider
    UIImage *divderImg = [UIImage resizeImageWithName:@"divider"]
    ;
    UIImageView *divderView = [[UIImageView alloc] initWithImage:divderImg];
    NSInteger divderY = CGRectGetMaxY(commentNums.frame);
    CGRect divderRect = CGRectMake(0, divderY, kScreenW, 1);
    divderView.frame = divderRect;
    [header addSubview:divderView];
    
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect footViewRect = CGRectMake(0, 0, kScreenW, 50);
    RYToolBar *footView = [[RYToolBar alloc] initWithFrame:footViewRect];
    return footView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYDetailFrame *detailFrame = [self.datas objectAtIndex:indexPath.row];
    return detailFrame.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kCellSectionH;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50;
}



#pragma mark 懒加载

- (NSMutableArray *)datas
{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
        
        NSArray *arr1 = @[
                          @{
                              @"icon":@"Persion_Image",
                              @"userName":@"喵星美呆",
                              @"time":@"06-02 3:05",
                              @"content":@"现在的小孩子真是太聪明了",
                              },
                          @{
                              @"icon":@"person_default_icon",
                              @"userName":@"小雨哗哗",
                              @"time":@"06-02 3:05",
                              @"content":@"可不可以不要这么可爱.",
                              },
                          @{
                              @"icon":@"person_icon",
                              @"userName":@"lucyIs",
                              @"time":@"06-02 3:05",
                              @"content":@"赞一下 !!",
                              },
                
                          @{
                              @"icon":@"Head",
                              @"userName":@"helloWorld",
                              @"time":@"06-02 3:05",
                              @"content":@"好温馨的感觉 !!!",
                              },
                          ];
        //字典转模型
        for (int i = 0; i < arr1.count; i++) {
            NSDictionary *dict = [arr1 objectAtIndex:i];
            RYDetail *detail = [RYDetail detailWithDict:dict];
            RYDetailFrame *detailFrame = [[RYDetailFrame alloc] init];
            detailFrame.detail = detail;
            
            [_datas addObject:detailFrame];
            
        }
        
    }
    return _datas;
}


@end
