//
//  RYPsychologyViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYPsychologyViewController.h"
#import "RYPsychologyCell.h"
#import "RYBookModel.h"
#import "RYPublicViewController.h"

// UICollectionView的item宽度
#define ITEMS_WIDTH1 ([UIScreen mainScreen].bounds.size.width - 42) / 3
#define ITEMS_HIGHT1 ITEMS_WIDTH1 + 30
// 图片与title的数据

@interface RYPsychologyViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

{
    NSMutableArray *dateArray;
}

@end

@implementation RYPsychologyViewController

- (void)dealloc
{
    
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)loadView
{
    self.myView = [[RYPsychologyView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
    
    [self.myView.collection registerClass:[RYPsychologyCell class] forCellWithReuseIdentifier:@"identifier"];
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
    
    [self datas];
}

- (void)backButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark UICollectionView的代理方法和实现
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dateArray.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath

{
    return CGSizeMake(ITEMS_WIDTH1, ITEMS_HIGHT1);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    RYPsychologyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifier" forIndexPath:indexPath];
    RYBookModel *model = [dateArray objectAtIndex:indexPath.item];
    cell.Image.image = [UIImage imageNamed:model.labelImage];
    cell.labelName.text = model.labelTitle;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    RYPublicViewController *publicView = [[RYPublicViewController alloc] init];
    publicView.model = [dateArray objectAtIndex:indexPath.row];
    publicView.headerTag = 2;
    publicView.tag = indexPath.row;
    [self.navigationController pushViewController:publicView animated:YES];
}

// 加载测试数据
- (void)datas
{
    dateArray = [NSMutableArray array];
    NSMutableArray *tempArr = [NSMutableArray array];
    NSArray *dict = @[
                      @{
                          @"labelTitle":@"李子勋",
                          @"labelContent":@"李子勋，毕业于华西医科大学，中日友好医院心理医生，首届中德高级心理治疗师培训项目学员，心理协会北京心理咨询与治疗专业委员会成员。 中央电视台《心理访谈》、《实话实说》，北京电视台《心理时间》，中央人民广播电台《星星夜谈》、《情感世界》特约心理专家，汇名家网特约讲师。《父母必读》、《女友》、《时尚健康》等健康与时尚杂志的专栏作家。",
                          @"labelTag":@"神经类咨询专家",
                          @"labelImage":@"psychology_a",
                          @"labelClass1":@"亲子关系 家庭关系 婚恋关系",
                          @"labelClass2":@"对人和蔼,与其沟通会感觉特别舒服,本着以人为本的态度为每一个对象服务",
                          },
                      @{
                          @"labelTitle":@"柏燕谊",
                          @"labelContent":@"柏燕谊，女，居于北京，著名心理咨询师及畅销书作家。著有《爱情很残酷，你要学点擒拿术》、《女人挖坑男人跳》、《不要自己坑自己》、《爱暴力》、《无色男女：女人专属的友情经营书》等多部作品，《夜线》《金牌调解》《第三调解室》《生活广角》《名人堂》等特约心理专家，长期担任《时尚芭莎》《健康之友》《都市主妇》《健康之家》《虹Madame Figaro》《女友家园》《大学生杂志》《婚姻与家庭》《时尚健康》《家庭医生报》专栏作家。",
                          @"labelTag":@"资询项目专家",
                          @"labelImage":@"psychology_b",
                          @"labelClass1":@"亲子关系 职场关系 青少年问题 各类神经病",
                          @"labelClass2":@"坚持以人为本的态度,真诚的关怀与尊重来访",
                          },
                      ];
    NSArray *dict2 = @[
                       @{
                           @"labelTitle":@"康斯坦丁·斯蒂基特",
                           @"labelContent":@"康斯坦丁·斯蒂基特，社会心理学家、教授、博士生导师，美国俄亥俄州立大学社会心理学博士，英国南安普敦大学心理学院自我与认同中心主任，英国社会科学院院士，英国社会与人格心理学会主席，先后任教于美国威斯康星大学麦迪逊分校、北卡罗来纳大学教堂山分校",
                           @"labelTag":@"社会心理学家",
                           @"labelImage":@"psychology_c",
                           @"labelClass1":@"婚恋家庭 亲子关系 职场关系",
                           @"labelClass2":@"实事求是,对症下药",
                           },
                       ];
    [tempArr addObject:dict];
    [tempArr addObject:dict2];
    
    
    for (NSArray *dict in tempArr) {
        for (NSDictionary *d in dict) {
            RYBookModel *bookModel = [[RYBookModel alloc] init];
            [bookModel setValuesForKeysWithDictionary:d];
            [dateArray addObject:bookModel];
        }
    }
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
