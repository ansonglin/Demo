//
//  RYCenterViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYCenterViewController.h"
#import "RYCenterView.h"
#import "Province.h"
#import "City.h"
#import "Area.h"

@interface RYCenterViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

// 数组里面存放所有省的名字
@property (nonatomic, retain) NSMutableArray *proArr;
// 选中的省份所在行
@property (nonatomic, assign) NSInteger proSeleteRow;
// 选中的市所在行
@property (nonatomic, assign) NSInteger citySeleteRow;

@end

@implementation RYCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configNav];
    [self createView];
    [self handleData];
    self.proSeleteRow = 0;
    self.citySeleteRow = 0;
}

- (void)createView
{
    // 创建UITableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"centerCell"];
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    [self.tableView setTableFooterView:v];
    [self.view addSubview:_tableView];
    
    // 创建UIToolbar
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, kScreenH - 150, kScreenW, 30)];
    _toolbar.hidden = YES;
    self.toolbar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_toolbar];
    
    // 创建UIPickerView
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenH - 120, kScreenW, 120)];
    _pickerView.hidden = YES;
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
//    self.pickerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_pickerView];
    
    NSMutableArray *buttons=[[NSMutableArray  alloc]initWithCapacity:2];
    //创建一个系统按钮, 并且加入到Array中, 放到左边
    UIBarButtonItem *cancelButton=[[UIBarButtonItem alloc]  initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancelButton:)];
    [buttons addObject:cancelButton];
    //创建一个空格，加入到array，用来将下面加入的按钮按照右边对齐
    UIBarButtonItem *SpaceButton=[[UIBarButtonItem alloc]  initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [buttons addObject:SpaceButton];
    //创建一个系统按钮，加入到array，放到右边
    UIBarButtonItem *certainButton=[[UIBarButtonItem alloc]  initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(certainButton:)];
    [buttons addObject:certainButton];
    //最后，将array 设置给toolbar
    [self.toolbar setItems:buttons animated:YES];
}

#pragma mark 加载本地数据
- (void)handleData
{
    // 获取本地文件
    NSError *error;
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"area"ofType:@"txt"];
    NSString *str=[[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    // 对字符串分割
    // 以"\n"为标识, 将字符串分割为小字符串存储到一个大数组中
    NSArray *strArr = [str componentsSeparatedByString:@"\n"];
    // 1. 创建一个大数组, 用来装省的字典
    self.proArr = [NSMutableArray array];
    for (NSString *temp in strArr) {
        if (![temp hasPrefix:@" "]) {
            // 每次遇到省名的时候, 创建一个省类的对象
            Province *pro = [[Province alloc] init];
            pro.name = temp; //设置省名
            [self.proArr addObject:pro];// 将省的对象添加到大数组中
        } else if (![temp hasPrefix:@"    "]) {
            // 每次碰到市名 都创建一个新的市对象
            City *city = [[City alloc] init];
            city.name = temp;// 设置市名
            // 取得最近添加的省对象
            Province *pro = [self.proArr lastObject];
            // 将创建好的市对象添加到省的地区数组中
            [pro.distructs addObject:city];
        } else if ([temp hasPrefix:@"    "]) {
            // 取得 最近添加的省
            Province *pro = [self.proArr lastObject];
            // 取得省的地区中 最近添加的市
            City *city = [pro.distructs lastObject];
            // 将字符串添加到市的 地区数组中
            [city.distructs addObject:temp];
        }
    }
}

#pragma mark UIPickerView的代理方法与实现
//该UIPickerView将通过该方法来判断应该包含多少列。
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;//返回显示的列数
}

//确定每个轮子的每一项显示什么内容
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        self.proSeleteRow = row;//根据行将所对应的数据加载
        self.citySeleteRow = 0;
        [pickerView reloadAllComponents];
    }else if (component == 1) {
        self.citySeleteRow = row;
        [pickerView reloadAllComponents];

    } else if (component == 2) {
    }
}

#warning 返回当前列显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component == 0){
        return self.proArr.count;//省份个数
    } else if(component == 1){
        Province *pro = [[Province alloc]init];
        pro = [self.proArr objectAtIndex:self.proSeleteRow];//根据省份所在的行确定市的个数
        return pro.distructs.count;
    } else {
        Province *pro = [[Province alloc]init];
        pro = [self.proArr objectAtIndex:self.proSeleteRow];
        NSArray * cityArr = [NSArray arrayWithArray:pro.distructs];
        City *city = [cityArr objectAtIndex:self.citySeleteRow];
        return city.distructs.count;//根据省份所在的行确定市,再根据是所在的行确定区的行数
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    if (component == 0) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW / 3, 30)];//建立一个label用于显示信息
        Province *pro = [self.proArr objectAtIndex:row];
        NSArray *name = [pro.name componentsSeparatedByString:@" "];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [name objectAtIndex:0];
        myView.font = [UIFont systemFontOfSize:18];
        myView.backgroundColor = [UIColor clearColor];
    } else if (component == 1) {
        Province *pro = [[Province alloc]init];
        pro = [self.proArr objectAtIndex:self.proSeleteRow];
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW / 3, 30)];
        City *city = [pro.distructs objectAtIndex:row];
        NSArray *name = [city.name componentsSeparatedByString:@" "];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [name objectAtIndex:2];
        myView.font = [UIFont systemFontOfSize:16];
        myView.backgroundColor = [UIColor clearColor];
    } else {
        Province *pro = [[Province alloc]init];
        pro = [self.proArr objectAtIndex:self.proSeleteRow];
        NSArray * cityArr = [NSArray arrayWithArray:pro.distructs];
        City *city = [cityArr objectAtIndex:self.citySeleteRow];
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW / 3, 30)];
        NSString *name = [city.distructs objectAtIndex:row];
        NSArray *areaName = [name componentsSeparatedByString:@" "];//将string字符串转换为array数组
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [areaName objectAtIndex:4];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
    }
    return myView;
}

// 设置显示的宽度
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    CGFloat componentWidth = kScreenW / 3;
    return componentWidth;
}

// 设置显示的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    CGFloat componentHeight = 30.0;
    return componentHeight;
}

#pragma mark UITableView的代理方法与实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"centerCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"centerCell"];
    }
    NSArray *array = [NSArray arrayWithObjects:@"姓名", @"昵称", @"性别", @"年龄", @"出生体重", @"出生医院", @"手机号", @"电话", @"邮箱", @"祖籍", @"现居住地", @"邮编", nil];
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 祖籍与现居住地,需要弹出省市区选择器
    if (indexPath.row == 9 || indexPath.row == 10) {
        self.toolbar.hidden = NO;
        self.pickerView.hidden = NO;
        // 省市区选择器弹出时,抬高UITableView的高度以使其不被选择器遮挡
        NSTimeInterval animateWithDuration = 0.10f;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:animateWithDuration];
        CGRect rect = CGRectMake(0, -150, kScreenW, kScreenH);
        self.tableView.frame = rect;
        [UIView commitAnimations];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// 取消按钮点击事件
- (void)cancelButton:(UIButton *)sender
{
    self.toolbar.hidden = YES;
    self.pickerView.hidden = YES;
    self.tableView.frame = CGRectMake(0, 0, kScreenW, kScreenH);
}

// 确定按钮点击事件
- (void)certainButton:(UIButton *)sender
{
    
}

/**
 *  配置导航栏
 */
- (void)configNav
{
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"return_black"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.title = @"个人中心";
}

- (void)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
