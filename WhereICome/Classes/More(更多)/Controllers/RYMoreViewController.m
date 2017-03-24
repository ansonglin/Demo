//
//  RYMoreViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/5/28.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMoreViewController.h"
#import "RYAnimationListVC.h"
#import "RYSchoolsViewController.h"
#import "RYTeacherViewController.h"
#import "RYSafeViewController.h"
#import "RYPsychologyViewController.h"
#import "RYMusicViewController.h"
#import "RYCollectionBookVC.h"
#import "RYClassViewController.h"
#import "RYIdolViewController.h"
#import "RYFirstViewController.h"

#define HEIGHTFORROW 37

@interface RYMoreViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, strong) NSArray *arrContent;

@end

@implementation RYMoreViewController
/**
 *  代理置空
 */
- (void)dealloc
{
    self.myView.tableView.delegate = nil;
    self.myView.tableView.dataSource = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
/**
 *  创建视图
 */
- (void)loadView
{
    self.myView = [[RYMoreView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) Delegate:self];
    self.view = self.myView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
#pragma mark 设置UITableView的分割线样式
//    self.myView.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self createData];
}


#pragma mark UITableView的代理方法和实现
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHTFORROW;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 8;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 3;
    } else if (section == 3) {
        return 1;
    }
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"tableviewcell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        if (indexPath.section == 0) {
            NSArray *titleArray = [NSArray arrayWithObjects:@"游戏", @"课程", @"书籍", @"音乐", @"玩具", @"学校", @"偶像", @"动画片", nil];
            NSArray *imageArray = [NSArray arrayWithObjects:@"more_game", @"more_classroom", @"more_book", @"more_music", @"more_toy", @"more_school", @"more_idol", @"more_animation", nil];
            [cell.textLabel setText:[titleArray objectAtIndex:indexPath.row]];
            [cell.imageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
        } else if (indexPath.section == 1){
            NSArray *titleArray = [NSArray arrayWithObjects:@"老师主页", @"心理专家", @"智力开发", nil];
            NSArray *imageArray = [NSArray arrayWithObjects:@"more_teacher_home", @"more_psychological", @"more_intelligence", nil];
            [cell.textLabel setText:[titleArray objectAtIndex:indexPath.row]];
            [cell.imageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
        } else if (indexPath.section == 2){
            NSArray *titleArray = [NSArray arrayWithObjects:@"帮助中心", @"安全隐私", @"法律条款", nil];
            NSArray *imageArray = [NSArray arrayWithObjects:@"more_help", @"more_privacy", @"more_law", nil];
            [cell.textLabel setText:[titleArray objectAtIndex:indexPath.row]];
            [cell.imageView setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]]];
        } else if (indexPath.section == 3) {
            cell.textLabel.text = @"退出";
            [cell.imageView setImage:[UIImage imageNamed:@"more_exit"]];
        }
    }
#pragma mark 设置UITableViewCell的cell样式,是一个枚举类型
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
#pragma mark 没有数据,不知咋写
    if (indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 7)) {
        RYAnimationListVC *VC = [[RYAnimationListVC alloc] init];
        VC.state = indexPath.row;
        [self.navigationController pushViewController:VC animated:YES];
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        RYSchoolsViewController *school = [[RYSchoolsViewController alloc] init];
        [self.navigationController pushViewController:school animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 0) {
        RYTeacherViewController *teacher = [[RYTeacherViewController alloc] init];
        [self.navigationController pushViewController:teacher animated:YES];
    } else if (indexPath.section == 2 && indexPath.row < 2) {
        RYSafeViewController *safes = [[RYSafeViewController alloc] init];
        NSArray *arr = [NSArray arrayWithObjects:@"帮助中心", @"安全隐私", nil];
        
        safes.titleA = [arr objectAtIndex:indexPath.row];
        safes.content = [_arrContent objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:safes animated:YES];
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        RYPsychologyViewController *psychology = [[RYPsychologyViewController alloc] init];
        [self.navigationController pushViewController:psychology animated:YES];
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        RYMusicViewController *music = [[RYMusicViewController alloc] init];
        [self.navigationController pushViewController:music animated:YES];
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        RYCollectionBookVC *book = [[RYCollectionBookVC alloc] init];
        [self.navigationController pushViewController:book animated:YES];
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        RYClassViewController *classView =[[RYClassViewController alloc] init];
        [self.navigationController pushViewController:classView animated:YES];
    } else if (indexPath.section == 0 && indexPath.row == 6) {
        RYIdolViewController *idol = [[RYIdolViewController alloc] init];
        [self.navigationController pushViewController:idol animated:YES];
    } else if (indexPath.section == 3) {
        // 返回登录页面
        RYFirstViewController *first = [[RYFirstViewController alloc] init];
        [self presentViewController:first animated:YES completion:nil];
    }
    // 取消cell选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)createData
{
    _arrContent = [NSArray array];
    _arrContent = [NSArray arrayWithObjects:@"有任何问题和意见都欢迎你给我们反馈，你也可以发送邮件到： ry@zgruiyu.com。\
                     \n1.如何添加我的孩子？\
                     \n2.如何修改孩子资料？\
                     \n3.如何删除我的孩子？\
                     \n4.不小心删除孩子账号，如何恢复？\
                     \n5.“朋友的孩子”是什么？添加“朋友的孩子”意味着什么？\
                     \n6.如何添加朋友的孩子？\
                     \n7.如何删除朋友的孩子？\
                     \n8.“粉丝团”是什么？和“家人”有什么区别？\
                     \n9.如何添加家人？\
                     \n10.如何更改或者删除家人？\
                     \n11.如何添加粉丝？\
                     \n12.如何将粉丝移动到家人或者删除粉丝？\
                     \n13.我可以在电脑网页上访问孩子的whereIcome吗？\
                     \n14.孩子的专属网址是什么？如何设置？\
                     \n15.“私密的”和“非隐私的”分别意味着什么？\
                     \n16.我们上传到“whereIcome”的数据安全吗？\
                     \n17.“whereIcome”能保护孩子数据的隐私吗？\
                     \n18可以将上传到“whereIcome”上的日记和照片备份到自己的电脑里吗？\
                     \n19.如果需要上传的照片在电脑里怎么办？\
                     \n20.为什么我不能删除其他人上传的内容？\
                     \n21.“whereIcome”只支持安卓手机和iPhone吗？\
                     \n22.可以把我孩子的“whereIcome”打印成一本书吗?\
                     \n23.如何让孩子的其他亲人共同记录孩子的成长？\
                     \n24.如果上传照片的时间不正确怎么办？\
                     \n25.怎么找到并关注我的朋友的孩子？\
                     \n26.不想收到通知，怎么办？\
                     \n27.更换手机或退出账户，whereIcome里的数据会丢失吗？\
                     \n28.我有其他问题，怎么办？\
                     \n29如何添加我的孩子？\n\n1.您可以在whereIcome同时记录多个小孩的成长。进入whereIcome手机APP后，向右滑动屏幕，会出现孩子列表。在我的孩子处添加小孩，填写孩子资料就可以了。今后可以在我的孩子列表里面，点击孩子头像，进入该孩子的whereIcome主页，浏览或上传该孩子的资料。\
                     \n2.如何修改孩子资料？\n进入孩子whereIcome的主页后，点击头像右侧的设置按钮，进入孩子资料的设置页面，点击右上角的编辑按钮，可以修改孩子的姓名、生日、头像及生日等信息。                    \n3.如何删除我的孩子？\n如果您不小心多添加了一个孩子的账户，是可以删除的。如果孩子账户中有资料，进入想要删除的孩子主页后，点击头像右侧的设置按钮，进入孩子资料的设置页面，在这个页面的底部，会有删除孩子的whereIcome的选项。如果孩子账户中是空白的，长按空白处，就会出现删除孩子小屋的选项.                     \n4.不小心删除孩子账号，如何恢复？\n如果您不小心删除了孩子的账号，请发送孩子姓名、生日、您与孩子的关系, 到whereIcome的客服邮箱 ry@zgruiyu.com ,我们核实情况后会帮您恢复误删除的账号。                     \n5.“朋友的孩子”是什么？添加“朋友的孩子”意味着什么？\n当您添加了朋友的孩子，您就成为了他的粉丝，可以关注她的成长，并和他的父母交流。如果对方也想关注您的孩子，您需要同样将对方添加为粉丝。                     \n6.如何添加朋友的孩子？\n进入whereIcome手机APP后，向右滑动屏幕，会出现孩子列表，在朋友的孩子添加伙伴。可以搜索孩子全名，或者当面扫描二维码，或者通过微信发送链接邀请朋友。                     \n7.如何删除朋友的孩子？\n如果您不小心添加了错误的朋友的孩子，是可以删除的。通过朋友的孩子列表，点击想要删除的孩子头像，进入该孩子主页。如果这个孩子的whereIcome是空白的，长按空白处，就会有删除孩子的选项。如果孩子的whereIcome有内容，点击头像右侧的设置按钮，进入设置页面就可以看到删除孩子的选项。                     \n8.“粉丝团”是什么？和“家人”有什么区别？\n“家人”是孩子whereIcome的管理者，可以查看到所有瞬间，并可以共同编辑和管理孩子的“whereIcome”。而“粉丝团”是孩子成长的关注者，由家人授权，只能查看和评论您孩子“非隐私”的瞬间。                     \n9.如何添加家人？\n手机APP中，进入小孩whereIcome首页，点击孩子头像下面的家人按钮，即可通过短信、邮件、或者微信发送邀请链接给家人。如果家人还没有下载whereIcome，收到邀请连接后，会跳转到下载whereIcome的页面，下载whereIcome后即可注册账号成为孩子家人。如果家人已经下载whereIcome，点击链接后会直接打开whereIcome，成为孩子家人。                     \n10.如何更改或者删除家人？\n进入whereIcome后，点击孩子头像下面的家人按钮，进入家人列表。点击想要更改或删除的家人名字，可以更改该家人与孩子的关系，将该家人设为粉丝，或者删除该家人。                     \n11.如何添加粉丝？\n手机APP中，进入小孩whereIcome首页，点击孩子头像下面的粉丝按钮，即可通过短信、邮件、或者微信发送邀请链接。如果被邀请的人还没有下载whereIcome，收到邀请连接后，会跳转到下载whereIcome的页面，下载whereIcome后即可注册账号成为孩子的粉丝。如果被邀请的人已经下载whereIcome，点击链接后会直接打开whereIcome，成为孩子粉丝。                     \n12.如何将粉丝移动到家人或者删除粉丝？\n进入whereIcome后，点击孩子头像下面的粉丝按钮，进入粉丝列表。点击想要更改或删除的粉丝名字，可以更将该粉丝设为家人，或者删除该粉丝。                     \n13.我可以在电脑网页上访问孩子的whereIcome吗？\n可以的。通过如下两种方式可以在电脑上访问孩子的whereIcome。方式一，进入whereIcome的官网  http://shanghairuiyu.cn/ ，用您的用户名和密码登录whereIcome。方式二，在手机APP中设置孩子的专属网址，设置完成后，直接通过专属网址在电脑网页上访问孩子的whereIcome。                     \n14.孩子的专属网址是什么？如何设置？\n孩子的专属网址是“whereIcome”为您孩子生成的个人网站的地址。您可以通过它访问孩子的个人网站；也可以方便地让家人和朋友通过whereIcome地址看到孩子最新的成长。 如果您还未给孩子添加whereIcome地址，您可以在手机上的[孩子设置]页找到该功能，您可以通过点击孩子首页列表顶部的设置按钮，进入孩子设置页。                     \n15.“私密的”和“非隐私的”分别意味着什么？\n非隐私的：对所有可以查看孩子的“whereIcome”的人可见。\
                     私密的：只对该孩子的家人可见                     \n16.我们上传到“whereIcome”的数据安全吗？\n我们视用户的数据安全为第一要务，用户上传的所有内容都储存在安全可靠的服务器上，并且每天都会进行备份，确保数据不会丢失。                     \n17.“whereIcome”能保护孩子数据的隐私吗？\n“whereIcome”中孩子的数据都是隐私的，只有您授权的人（包括家人、朋友、访客）才能查看。如果你希望某些数据只对家人可见，你可以将它们设置为“私密的”。 什么是“私密的”和“非隐私的”？                     \n18.可以将上传到“whereIcome”上的日记和照片备份到自己的电脑里吗？\n可以！您可以在手机上的[孩子设置]页找到备份功能（您可以通过点击孩子首页列表顶部的设置按钮，进入孩子设置页），能将所有您上传的内容导出到您的电脑里，并支持网页离线浏览。                     \n19.如果需要上传的照片在电脑里怎么办？\n您可以使用网页端管理和查看孩子的成长，网页端可以通过您孩子的专属网址(什么是专属网址？）或shanghairuiyu.cn访问。                     \n20.为什么我不能删除其他人上传的内容？\n只有创建者和孩子的父母有权限删除所有内容，其他家人只能删除自己上传的照片。                     \n21.“whereIcome”只支持安卓手机和iPhone吗？\n目前“whereIcome”除了Android和iPhone客户端之外，还有网页客户端（网页端可以通过您孩子的专属网址或shanghairuiyu.cn访问。）。在将来我们会努力支持更多平台。也欢迎您告诉我们你需要支持的平台。                     \n22.可以把我孩子的“whereIcome”打印成一本书吗？\n我们目前还不提供打印服务，但是将孩子的成长记录打印成册是我们今后的重点之一，我们会尽快支持的！敬请期待。                     \n23.如何让孩子的其他亲人共同记录孩子的成长？\n您可以在手机上通过多种方式邀请家人。被添加的家人接受邀请后，该家人就可以和您一起共同记录孩子的成长了。                     \n24.如果家人没有智能手机怎么办？\n他们可以使用网页端管理和查看孩子的成长，网页端可以通过您孩子的专属网址(什么是专属网址？）或shanghairuiyu.cn访问。                     \n25.如果上传照片的时间不正确怎么办？\n通常情况下，whereIcome可以读取照片的时间信息，自动排列在正确的位置上。如果照片经过其他软件的处理，可能会丢失时间信息，导致时间错误，这种情况下，你可以在上传之前或之后，在照片编辑里修改照片的日期。                     \n26.怎么找到并关注我的朋友的孩子？\n如果您的朋友也使用了“whereIcome”，您可以在[添加朋友的孩子]通过搜索朋友孩子全名找到他的孩子，并申请关注他的孩子。 如果您的朋友没有使用“whereIcome”，您可以在[添加朋友的孩子]邀请朋友加入。在他使用后，您就可以通过搜索关注他的孩子了。 您可以在首頁向右滑动，展开列表，看到“添加朋友的孩子”。                     \n27.不想收到通知，怎么办？\n您可以在[通用设置]中，设置手机通知和邮件通知是否发送。                     \n28.更换手机或退出账户，whereIcome里的数据会丢失吗？\nwhereIcome里的数据都是安全隐私地保持在我们的服务器里的，同时会有多个备份。所以，更换手机、退出账户等任何情况都不会导致数据丢失的，您只需要记住登陆账号，重新登陆whereIcome就好了。                     \n29.我有其他问题，怎么办？\n我们欢迎您的任何意见和建议，您可以使用反馈功能，或者发送邮件到：ry@zgruiyu.com",    @"保护数据的安全和隐私是全公司的重中之重，我们采用了严谨成熟的方案来保护用户的每一份数据：\n\n1.我们的IT基础设施架构在Amazon S3上。AWS是全球使用量最高、最成熟稳定的云服务解决方案。很多国内外著名的公司同样使用了S3存储用户数据，如：Dropbox，Pinterest，Netflix，OPPO，奇虎360，Yelp，Foursquare，Spotify，NASDAQ...\n\n2.数据库和云存储实时异地多机房同步。\n\n3.数据库每小时全量备份；云存储每日增量备份。\n\n4.保留一个月内所有被删除的数据，以及删除者信息，并支持数据恢复。\n\n5.严格控制用户权限，并记录所有访问者信息。就算是公司内部人员访问用户数据也有严格的岗位限制。\n\n6.用户也可以随时全量导出数据。\n\nwhereicome的云存储服务从安全性和稳定性上，绝对不亚于国内任何一家公司的网盘和云相册服务。而在对隐私的保护上，我们做得比他们都多。\n\n就算发生了最坏的情况（公司倒闭），我们也会保证提前3个月通知所有用户导出所有数据。数据不仅包括所有照片、视频、日记、时光胶囊及其附属信息，甚至包括添加的描述、评论和其他所有您添加的所有内容。同时保证用户可以通过网页离线查看之前的记录。", nil];
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
