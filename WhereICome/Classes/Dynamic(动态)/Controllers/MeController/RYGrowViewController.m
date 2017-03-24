//
//  RYGrowViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/12.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYGrowViewController.h"
#import "RYGrowOnlyTextCell.h"

#define CELLTEXT1 @"今天周四啦,小宝贝就要满两岁啦,很高兴,等会带宝宝去拍照留念,给宝贝留下一个美好的童年."

#define CELLTEXT2 @"今天是2014-08-02,时间是10:23,星期六,宝宝不听话,我就罚他必须把饭吃完,嘿嘿"



@interface RYGrowViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *textArray;
@property (nonatomic, strong) NSMutableArray *timeArray;

@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation RYGrowViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _imageArray = [NSMutableArray arrayWithObjects:@"growth_log_pic_a", @"growth_log_pic_b", @"growth_log_pic_c", @"growth_log_pic_d", @"growth_log_pic_e", nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self detes];
    
    [self.tableView registerClass:[RYGrowOnlyTextCell class] forCellReuseIdentifier:@"growcell"];
    [self setTableViewStyle];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.title = @"成长日志";
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 设置messageTableView的背景色和去掉分割线
- (void)setTableViewStyle
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;  //去掉tabelView分割线
    CGFloat R  = (CGFloat) 242/255.0;
    CGFloat G = (CGFloat) 242/255.0;
    CGFloat B = (CGFloat) 242/255.0;
    CGFloat alpha = (CGFloat) 1.0;
    UIColor *ColorRGB = [ UIColor colorWithRed: R green: G blue: B alpha: alpha];
    [self.tableView setBackgroundColor:ColorRGB];
    
}
#pragma mark -
#pragma mark UITableView的代理方法和实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17.0f], NSFontAttributeName, nil];
    NSString *text = [_textArray objectAtIndex:indexPath.row];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(kScreenW - 60, 1000) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:dic context:nil];
    CGFloat hight = rect.size.height + 64;
    return hight;
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _textArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYGrowOnlyTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"growcell"];
    if (!cell) {
        cell = [[RYGrowOnlyTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"growcell"];
    }
    
    cell.labelTime.text = [_timeArray objectAtIndex:indexPath.row];
    cell.labelContent.text = [_textArray objectAtIndex:indexPath.row];
    
    //去掉提供的选中无颜色
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)detes
{
    _textArray = [NSMutableArray array];
    [_textArray addObject:CELLTEXT1];
    [_textArray addObject:CELLTEXT2];
    
    _timeArray = [NSMutableArray arrayWithObjects:@"2014-05-14 11:11:11 星期四", @"2014-08-02 10:23:05 星期六", nil];
    
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
