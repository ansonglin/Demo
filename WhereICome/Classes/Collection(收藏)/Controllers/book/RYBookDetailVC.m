//
//  RYCollectionDetailVC.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYBookDetailVC.h"
#import "RYMoreView.h"
#import "RYBookReadController.h"

@interface RYBookDetailVC ()<UITableViewDelegate,UITableViewDataSource>

{
    NSMutableArray *dataArray1;
}

@end

@implementation RYBookDetailVC

- (void)dealloc
{
    
}

- (void)loadView
{
    self.myView = [[RYBookDetailView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // 当push到当前页面时隐藏tabbar
        self.hidesBottomBarWhenPushed = YES;
        dataArray1 = [NSMutableArray arrayWithObjects:@"前言", @"序言: 关于男爵", @"闵希豪生男爵的自述", @"海上历险一", @"海上历险二", @"海上历险三", @"海上历险四", @"海上历险五", @"海上历险六", @"海上历险七", @"海上历险八", @"海上历险九", @"海上历险十", @"海上历险十一", @"海上历险十二", @"海上历险十三", @"海上历险十四", @"海上历险十五", @"海上历险十六",nil];
        
            }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 20, 10, 20);
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton setBackgroundImage:[UIImage imageNamed:@"return_black"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    // 对书籍详情页面赋值
    self.myView.ImageView.image = [UIImage imageNamed:_model.labelImage];
    self.myView.labelTitle.text = _model.labelTitle;
    self.myView.labelAuthor.labelAuthor.text = _model.labelName;
    self.myView.labelTool.labelTitle.text = _model.labelTag;
    self.myView.labelContents.text = _model.labelContent;
    
    [self.myView.buttonRead addTarget:self action:@selector(buttonReadAction) forControlEvents:UIControlEventTouchUpInside];
}


- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)buttonReadAction
{
    RYBookReadController *readVC = [[RYBookReadController alloc] init];
    readVC.bookName = _model.labelTitle;
    [self.navigationController pushViewController:readVC animated:YES];
}

#pragma mark -
#pragma mark UITableView的代理方法和实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray1.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    // 书籍的章节赋值
    cell.textLabel.text = [dataArray1 objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RYBookReadController *read = [[RYBookReadController alloc] init];
    read.bookName = _model.labelTitle;
    [self.navigationController pushViewController:read animated:YES];
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
