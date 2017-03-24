//
//  RYNewRemarkController.m
//  WhereICome
//
//  Created by 安松林 on 15/7/6.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYNewRemarkController.h"

@interface RYNewRemarkController ()<UITextViewDelegate>

@end

@implementation RYNewRemarkController

// 在视图出现的时候弹出键盘来实现备注
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
    [self handleNewTime];
    [self configNav];
    
    
}

- (void)createView
{
    // 创建文本框
    self.textView = [[RYTextView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH / 2)];
    _textView.delegate = self;
    _textView.placeholder = @"备注点什么吧";
    _textView.placeholderColor = [UIColor grayColor];
    [self.view addSubview:_textView];
    
    // 创建删除按钮
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _deleteBtn.frame = CGRectMake(kScreenW / 2 - 20, kScreenH - 40, 40, 40);
    [_deleteBtn setImage:[UIImage imageNamed:@"remark_delete"] forState:UIControlStateNormal];
    [_deleteBtn addTarget:self action:@selector(deleteBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteBtn];
    
    // 创建弹出视图来确定是否删除新建备注
    self.deleteSure = [self createButtonWithTitle:@"删除新建备注" andFrame:CGRectMake(10, kScreenH - 140, kScreenW - 20, 30) andColor:[UIColor redColor]];
    _deleteSure.hidden = YES;
    [_deleteSure addTarget:self action:@selector(deleteSureAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteSure];
    self.deleteCancel = [self createButtonWithTitle:@"取消" andFrame:CGRectMake(10, kScreenH - 90, kScreenW - 20, 30) andColor:[UIColor whiteColor]];
    _deleteCancel.hidden = YES;
    [_deleteCancel addTarget:self action:@selector(deleteCancelAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_deleteCancel];
    
}

// 是否弹出视图来删除新建备注
- (void)deleteBtnAction
{
    if (_deleteCancel.hidden == YES) {
        _deleteCancel.hidden = NO;
        _deleteSure.hidden = NO;
    } else {
        _deleteCancel.hidden = YES;
        _deleteSure.hidden = YES;
    }
}

- (void)deleteSureAction
{
    _deleteCancel.hidden = YES;
    _deleteSure.hidden = YES;
    self.textView.text = nil;
}

- (void)deleteCancelAction
{
    _deleteCancel.hidden = YES;
    _deleteSure.hidden = YES;
}

- (UIButton *)createButtonWithTitle:(NSString *)title andFrame:(CGRect)frame andColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
    button.layer.cornerRadius = 10;
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:20.0f];
    return button;
}

// 当前时间
- (void)handleNewTime
{
    // 当前时间
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    int year = [dateComponent year];
    int month = [dateComponent month];
    int day = [dateComponent day];
    int hour = [dateComponent hour];
    int minute = [dateComponent minute];
    int second = [dateComponent second];
    NSString *newTime = [NSString stringWithFormat:@"%d-%d-%d %d:%d:%d", year, month, day, hour, minute, second];
    // 当前周几
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar1 = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    NSDateComponents *theComponents = [calendar1 components:calendarUnit fromDate:now];
    NSString *newWeek = [weekdays objectAtIndex:theComponents.weekday];
    self.newtime = [NSString stringWithFormat:@"%@ %@", newTime, newWeek];
}
// 当备注编写完成的时候,把文本赋值给所设属性
- (void)textViewDidEndEditing:(UITextView *)textView
{
    _newreamrk = self.textView.text;
}

/**
 *  配置导航栏
 */
- (void)configNav
{
    // 创建返回按钮
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    UIImage *image = [UIImage imageNamed:@"return_black"];
    [btn setImage:image forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    btn.frame = CGRectMake(0, 0, 30, 44);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.title = @"新建备注";
    // 创建完成按钮
    UIButton * button_back = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW - 50, 0, 44.0f, 44.0f)];
    [button_back setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)];
    [button_back setTitle:@"完成" forState:UIControlStateNormal];
    [button_back setTitleColor:[UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1] forState:UIControlStateNormal];
    [button_back.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [button_back addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button_back];
    [backButton setStyle:UIBarButtonItemStyleDone];
    [self.navigationItem setRightBarButtonItem:backButton];
    
    
}

- (void)back:(UIButton *)sender
{
    [self.delegate getNewTime:_newtime];
    [self.delegate getNewRemark:_newreamrk];
    [self.navigationController popViewControllerAnimated:YES];
}

// 完成按钮使键盘收回
- (void)rightButtonAction
{
    [self.textView resignFirstResponder];
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
