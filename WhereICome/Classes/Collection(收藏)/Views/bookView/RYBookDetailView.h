//
//  RYBookDetailView.h
//  WhereICome
//
//  Created by 安松林 on 15/6/5.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RYBookTools.h"
#import "RYBookAuthor.h"

@interface RYBookDetailView : UIView
// 书籍图片
@property (nonatomic, strong) UIImageView *ImageView;

// 书籍名
@property (nonatomic, strong) UILabel *labelTitle;

// 书籍作者
@property (nonatomic, strong) RYBookAuthor *labelAuthor;

// 书籍标签
@property (nonatomic, strong) RYBookTools *labelTool;

// 收藏按钮
@property (nonatomic, strong) UIButton *buttonCollection;

// 阅读按钮
@property (nonatomic, strong) UIButton *buttonRead;

// 书籍简介名
@property (nonatomic, strong) UILabel *labelContent;

// 书籍简介 默认显示两行
@property (nonatomic, strong) UILabel *labelContents;

// 展开按钮
@property (nonatomic, strong) UIButton *buttonOpen;

// 书籍目录
@property (nonatomic, strong) UITableView *tableView;

// 创建UIScrollView来存放书籍目录和书籍简介
@property (nonatomic, strong) UIScrollView *scrollView;

// 书籍简介展开状态
@property (nonatomic) BOOL state;

- (instancetype)initWithFrame:(CGRect)frame Delegate:(id)delegate;


@end
