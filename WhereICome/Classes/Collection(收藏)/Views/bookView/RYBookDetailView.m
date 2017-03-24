

//
//  RYBookDetailView.m
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYBookDetailView.h"

@implementation RYBookDetailView

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
       
       
        
        // 书籍图片
        self.ImageView = [[UIImageView alloc] init];
        [self addSubview:_ImageView];
        // 书籍名
        self.labelTitle = [[UILabel alloc] init];
        [self addSubview:_labelTitle];
        // 书籍作者
        self.labelAuthor = [[RYBookAuthor alloc] init];
        [self addSubview:_labelAuthor];
        // 书籍标签
        self.labelTool = [[RYBookTools alloc] init];
        [self addSubview:_labelTool];
        // 书籍收藏按钮
        self.buttonCollection = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonCollection setTitle:@"添加收藏" forState:UIControlStateNormal];
        [_buttonCollection setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _buttonCollection.layer.borderWidth = 1.0;
        [self addSubview:_buttonCollection];
        // 书籍阅读按钮
        self.buttonRead = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonRead setTitle:@"开始阅读" forState:UIControlStateNormal];
        [_buttonRead setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _buttonRead.backgroundColor = [UIColor colorWithRed:0 green:117 / 255.0 blue:169 / 255.0 alpha:1];
        [self addSubview:_buttonRead];
        
      
        // 书籍简介
        self.labelContent = [[UILabel alloc] init];
        _labelContent.text = @"简介";
        [_labelContent setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_labelContent];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 160, kScreenH, 50)];
        [self addSubview:_scrollView];
        // 书籍简介内容
        self.labelContents = [[UILabel alloc] init];
        _labelContents.textColor = [UIColor grayColor];
        _labelContents.font = [UIFont systemFontOfSize:13];
        _labelContents.numberOfLines = 0;
        self.labelContents.frame = CGRectMake(15, 0, kScreenW - 30, 32);
        [_scrollView addSubview:_labelContents];
        // 书籍简介展开按钮
        self.buttonOpen = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonOpen.titleLabel.font = [UIFont systemFontOfSize:13];
        [_buttonOpen setTitle:@"展开>" forState:UIControlStateNormal];
        [_buttonOpen setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_buttonOpen addTarget:self action:@selector(buttonOpenAction) forControlEvents:UIControlEventTouchUpInside];
        _buttonOpen.backgroundColor = [UIColor whiteColor];
        self.buttonOpen.frame = CGRectMake(kScreenW - 65, 32, 40, 16);

        [_scrollView addSubview:_buttonOpen];
        // 创建UITableView来显示书籍章节
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 210, kScreenW, kScreenH - 294) style:UITableViewStylePlain];
        _tableView.delegate = delegate;
        _tableView.dataSource = delegate;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
        label.text = @"目  录";
        label.font = [UIFont systemFontOfSize:24];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor grayColor];
        _tableView.tableHeaderView = label;
        _tableView.bounces = NO;
        _tableView.alwaysBounceHorizontal = NO;
        
        _tableView.alwaysBounceVertical = NO;
        [self addSubview:_tableView];
        
        
        

        _state = YES;
        
    }
    return self;
}

#pragma mark -
#pragma mark 书籍简介的展开与收起,改变书籍简介按钮,书籍内容,UITableView的frame
- (void)buttonOpenAction
{
    if (_state == YES) {
        // 根据字符串的高度来改变下面控件的frame
        CGSize size = CGSizeMake(kScreenW - 30, 1000);
        CGSize msgSie = [_labelContents.text sizeWithFont:[UIFont systemFontOfSize:13] constrainedToSize:size];
        
        _scrollView.contentSize = CGSizeMake(kScreenW, msgSie.height + 80);
        _scrollView.frame = CGRectMake(0, 160, kScreenH, kScreenH - 180);
        // 改变书籍简介的frame
        [_labelContents setFrame:CGRectMake(15, 0, kScreenW - 30, msgSie.height)];
        // 改变UITableView的frame
        CGRect rect = CGRectMake(0, 210 + msgSie.height - 32, kScreenW, kScreenH - 294);
        self.tableView.frame = rect;
        // 改变书籍简介展开按钮的frame
        [_buttonOpen setTitle:@"收起>" forState:UIControlStateNormal];
        self.buttonOpen.frame = CGRectMake(kScreenW - 65, msgSie.height, 40, 16);

        _state = NO;
    } else {
        self.labelContents.frame = CGRectMake(15, 0, kScreenW - 30, 32);
        self.tableView.frame = CGRectMake(0, 210, kScreenW, kScreenH - 294);
        [_buttonOpen setTitle:@"展开>" forState:UIControlStateNormal];
        self.buttonOpen.frame = CGRectMake(kScreenW - 65, 32, 40, 16);
        _scrollView.frame = CGRectMake(0, 160, kScreenH, 50);
        _scrollView.contentOffset = CGPointMake(0, 0);
        _scrollView.contentSize = CGSizeMake(kScreenW, 50);

        _state = YES;
    }
}
// 设置相关的frame
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.ImageView.frame = CGRectMake(15, 17, 111, 62);
    
    self.labelTitle.frame = CGRectMake(140, 20, kScreenW / 2, 16);
    
    self.labelAuthor.frame = CGRectMake(140, 43, kScreenW / 2, 12);
    
    self.labelTool.frame = CGRectMake(140, 63, kScreenW / 2, 12);
    
    self.buttonCollection.frame = CGRectMake(45, 89, (kScreenW - 135) / 2, 40);
    
    self.buttonRead.frame = CGRectMake(kScreenW - 45 - (kScreenW - 135) / 2, 89, (kScreenW - 135) / 2, 40);
    
    self.labelContent.frame = CGRectMake(15, 140, 40, 14);
}

@end
