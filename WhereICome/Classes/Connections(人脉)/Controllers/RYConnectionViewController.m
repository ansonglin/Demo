//
//  RYConnectionViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/5/27.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYConnectionViewController.h"
#import "RYInterfaceViewController.h"
#import "DateTableViewCell.h"
#import "DateModel.h"
#import "RATreeView.h"



@interface RYConnectionViewController ()<RATreeViewDataSource,RATreeViewDelegate>

@property (strong, nonatomic) NSArray *data;

@property (weak, nonatomic) RATreeView *treeView;


@end

@implementation RYConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadData];
    RATreeView *view = [[RATreeView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64)];
    view.collapsesChildRowsWhenRowCollapses = YES;
    view.delegate = self;
    view.dataSource = self;
    UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
    
    [view setTreeFooterView:v];
    
    self.treeView = view;
    [self.view insertSubview:view atIndex:0];

    [self.treeView registerClass:[DateTableViewCell class] forCellReuseIdentifier:@"cell"];
    

}

// 返回每个cell的高度
- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item
{
    NSInteger level = [self.treeView levelForCellForItem:item];
    if (level == 2) {
        return 50;
    } else {
        return 35;
    }
}

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item
{
    DateModel *model = item;
    NSInteger level = [self.treeView levelForCellForItem:item];
    
    
    DateTableViewCell *cell = [self.treeView dequeueReusableCellWithIdentifier:@"cell"];
    
    [cell setupWithTitle:model.name contentText:@"我们都是好孩子啊" numberTest:@"12/33" level:level imageI:model.imageI];
    
    
    if (level == 0 || level == 1) {
        
        cell.imageA.image = [UIImage imageNamed:@"drop_down"];
  
    }
    return cell;
}


// 取消点击事件响应效果
- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item
{
    NSInteger level = [self.treeView levelForCellForItem:item];
    if (level == 2) {
        RYInterfaceViewController *interFace = [[RYInterfaceViewController alloc] init];
        DateModel *model = item;
        interFace.str = model.name;
        [self.navigationController pushViewController:interFace animated:YES];
    }
    [self.treeView deselectRowForItem:item animated:YES];
}

// 返回每个分组的cell个数
- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [self.data count];
    }
    DateModel *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    DateModel *data = item;
    if (item == nil) {
        return [self.data objectAtIndex:index];
    }
    return data.children[index];
}

// 创建假数据
- (void)loadData
{
    DateModel *prople1 = [DateModel dataObjectWithName:@"爸爸" imageI:@"contacts_head_a" children:nil];
    DateModel *prople2 = [DateModel dataObjectWithName:@"妈妈" imageI:@"contacts_head_b" children:nil];
    DateModel *prople3 = [DateModel dataObjectWithName:@"哥哥" imageI:@"contacts_head_c" children:nil];
    DateModel *family1 = [DateModel dataObjectWithName:@"亲人分组1" imageI:nil children:[NSArray arrayWithObjects:prople1, prople2, prople3, nil]];
    DateModel *family2 = [DateModel dataObjectWithName:@"亲人分组2" imageI:nil children:[NSArray arrayWithObjects:prople1, prople2, prople3, nil]];
    DateModel *family3 = [DateModel dataObjectWithName:@"亲人分组3" imageI:nil children:[NSArray arrayWithObjects:prople1, prople2, prople3, nil]];
    DateModel *family = [DateModel dataObjectWithName:@"我的亲人" imageI:nil children:[NSArray arrayWithObjects:family1, family2, family3, nil]];
    
    DateModel *teacher1 = [DateModel dataObjectWithName:@"安老师" imageI:@"contacts_head_a" children:nil];
    DateModel *teacher2 = [DateModel dataObjectWithName:@"王老师" imageI:@"contacts_head_b" children:nil];
    DateModel *teacher3 = [DateModel dataObjectWithName:@"张老师" imageI:@"contacts_head_c" children:nil];
    DateModel *teacher4 = [DateModel dataObjectWithName:@"何老师" imageI:@"contacts_head_d" children:nil];
    DateModel *teacherA = [DateModel dataObjectWithName:@"小学老师" imageI:nil children:[NSArray arrayWithObjects:teacher1, teacher2, teacher3, teacher4, nil]];
    DateModel *teacherB = [DateModel dataObjectWithName:@"中学老师" imageI:nil children:[NSArray arrayWithObjects:teacher1, teacher2, teacher3, teacher4, nil]];
    DateModel *teacherC = [DateModel dataObjectWithName:@"大学老师" imageI:nil children:[NSArray arrayWithObjects:teacher1, teacher2, teacher3, teacher4, nil]];
    DateModel *teacher = [DateModel dataObjectWithName:@"我的老师" imageI:nil children:[NSArray arrayWithObjects:teacherA, teacherB, teacherC, nil]];
    
    DateModel *student1 = [DateModel dataObjectWithName:@"安安" imageI:@"contacts_head_a" children:nil];
    DateModel *student2 = [DateModel dataObjectWithName:@"小胖" imageI:@"contacts_head_b" children:nil];
    DateModel *student3 = [DateModel dataObjectWithName:@"黑子" imageI:@"contacts_head_c" children:nil];
    DateModel *student4 = [DateModel dataObjectWithName:@"凤" imageI:@"contacts_head_d" children:nil];
    DateModel *studentA = [DateModel dataObjectWithName:@"小学同学" imageI:nil children:[NSArray arrayWithObjects:student1, student2, student3, student4, nil]];
    DateModel *studentB = [DateModel dataObjectWithName:@"中学同学" imageI:nil children:[NSArray arrayWithObjects:student1, student2, student3, student4, nil]];
    DateModel *studentC = [DateModel dataObjectWithName:@"大学同学" imageI:nil children:[NSArray arrayWithObjects:student1, student2, student3, student4, nil]];
    DateModel *student = [DateModel dataObjectWithName:@"我的同学" imageI:nil children:[NSArray arrayWithObjects:studentA, studentB, studentC, nil]];
    
    DateModel *friend1 = [DateModel dataObjectWithName:@"小何" imageI:@"contacts_head_d" children:nil];
    DateModel *friend2 = [DateModel dataObjectWithName:@"Hely" imageI:@"contacts_head_b" children:nil];
    DateModel *friend3 = [DateModel dataObjectWithName:@"羽" imageI:@"contacts_head_a" children:nil];
    DateModel *friend4 = [DateModel dataObjectWithName:@"🐟" imageI:@"contacts_head_c" children:nil];
    DateModel *friendA = [DateModel dataObjectWithName:@"闺蜜" imageI:nil children:[NSArray arrayWithObjects:friend1, friend2, friend3, friend4, nil]];
    DateModel *friendB = [DateModel dataObjectWithName:@"死党" imageI:nil children:[NSArray arrayWithObjects:friend1, friend2, friend3, friend4, nil]];
    DateModel *friendC = [DateModel dataObjectWithName:@"朋友" imageI:nil children:[NSArray arrayWithObjects:friend1, friend2, friend3, friend4, nil]];
    DateModel *friend = [DateModel dataObjectWithName:@"小伙伴" imageI:nil children:[NSArray arrayWithObjects:friendA, friendB, friendC, nil]];
    
    DateModel *stranger1 = [DateModel dataObjectWithName:@"你若安好 便是晴天" imageI:@"contacts_head_a" children:nil];
    DateModel *stranger2 = [DateModel dataObjectWithName:@"罗密欧与朱丽叶" imageI:@"contacts_head_c" children:nil];
    DateModel *stranger3 = [DateModel dataObjectWithName:@"最爱小胖妹" imageI:@"contacts_head_d" children:nil];
    DateModel *stranger4 = [DateModel dataObjectWithName:@"你是我的我是你的我是谁的" imageI:@"contacts_head_b" children:nil];
    DateModel *strangerA = [DateModel dataObjectWithName:@"陌生人分组1" imageI:nil children:[NSArray arrayWithObjects:stranger1, stranger2, stranger3, stranger4, nil]];
    DateModel *strangerB = [DateModel dataObjectWithName:@"陌生人分组2" imageI:nil children:[NSArray arrayWithObjects:stranger1, stranger2, stranger3, stranger4, nil]];
    DateModel *strangerC = [DateModel dataObjectWithName:@"陌生人分组3" imageI:nil children:[NSArray arrayWithObjects:stranger1, stranger2, stranger3, stranger4, nil]];
    DateModel *stranger = [DateModel dataObjectWithName:@"陌生人" imageI:nil children:[NSArray arrayWithObjects:strangerA, strangerB, strangerC, nil]];
    
    self.data = [NSArray arrayWithObjects:family, teacher, student, friend, stranger, nil];
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
