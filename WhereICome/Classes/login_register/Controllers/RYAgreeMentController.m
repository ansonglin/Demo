//
//  RYAgreeMentController.m
//  WhereICome
//
//  Created by mkq on 15/6/4.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYAgreeMentController.h"
#import "UIView+corner.h"
@interface RYAgreeMentController ()

@property (nonatomic, weak)UIView *backView;
/**
 *  文本区
 */
@property (nonatomic, weak)UITextView *textView;

@end

@implementation RYAgreeMentController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建返回按钮
    [self setupBackView];
    //创建文本
    [self setupTextView];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:118 / 255.0 green:149 / 255.0 blue:189 / 255.0 alpha:1];
}

- (void)setupBackView
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(-1, -1, kScreenW+2, 64)];
    backView.backgroundColor = [UIColor whiteColor];
    [backView setUpViewCornerWidth:1 withBorderColor:[UIColor grayColor] withBorder:0];
    backView.alpha = 0.9;
    [self.view addSubview:backView];
    self.backView = backView;
    //添加返回按钮
    CGRect backRect = CGRectMake(0, 0, 40, 64);
    UIButton *back = [[UIButton alloc] initWithFrame:backRect];
    [back setImage:[UIImage imageNamed:@"return_black"] forState:(UIControlStateNormal)];
    [back addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    [backView addSubview:back];
}

- (void)setupTextView
{
    NSInteger textViewY = CGRectGetMaxY(self.backView.frame);
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, textViewY, kScreenW, kScreenH - textViewY)];
    textView.editable = NO;
    textView.editable = NO;
    textView.font = [UIFont systemFontOfSize:13];
    textView.textColor = RYColor(117, 127, 129);
    [self.view addSubview:textView];
    self.textView = textView;
    NSString *str = @"\
            \n\
    有任何问题和意见都欢迎你给我们反馈，你也可以发送邮件到： ry@zgruiyu.com。\
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
    \n29如何添加我的孩子？\n\
    \
    1.您可以在whereIcome同时记录多个小孩的成长。进入whereIcome手机APP后，向右滑动屏幕，会出现孩子列表。在我的孩子处添加小孩，填写孩子资料就可以了。今后可以在我的孩子列表里面，点击孩子头像，进入该孩子的whereIcome主页，浏览或上传该孩子的资料。\
    \
    \n2.如何修改孩子资料？\n\
    \
    进入孩子whereIcome的主页后，点击头像右侧的设置按钮，进入孩子资料的设置页面，点击右上角的编辑按钮，可以修改孩子的姓名、生日、头像及生日等信息。\
    \
    \n3.如何删除我的孩子？\n\
    \
    如果您不小心多添加了一个孩子的账户，是可以删除的。如果孩子账户中有资料，进入想要删除的孩子主页后，点击头像右侧的设置按钮，进入孩子资料的设置页面，在这个页面的底部，会有删除孩子的whereIcome的选项。如果孩子账户中是空白的，长按空白处，就会出现删除孩子小屋的选项。\
    \
    \n4.不小心删除孩子账号，如何恢复？\n\
    \
    如果您不小心删除了孩子的账号，请发送孩子姓名、生日、您与孩子的关系, 到whereIcome的客服邮箱 ry@zgruiyu.com ,我们核实情况后会帮您恢复误删除的账号。\
    \
    \n5.“朋友的孩子”是什么？添加“朋友的孩子”意味着什么？\n\
    \
    当您添加了朋友的孩子，您就成为了他的粉丝，可以关注她的成长，并和他的父母交流。如果对方也想关注您的孩子，您需要同样将对方添加为粉丝。\
    \
    \n6.如何添加朋友的孩子？\n\
    \
    进入whereIcome手机APP后，向右滑动屏幕，会出现孩子列表，在朋友的孩子添加伙伴。可以搜索孩子全名，或者当面扫描二维码，或者通过微信发送链接邀请朋友。\
    \
    \n7.如何删除朋友的孩子？\n\
    \
    如果您不小心添加了错误的朋友的孩子，是可以删除的。通过朋友的孩子列表，点击想要删除的孩子头像，进入该孩子主页。如果这个孩子的whereIcome是空白的，长按空白处，就会有删除孩子的选项。如果孩子的whereIcome有内容，点击头像右侧的设置按钮，进入设置页面就可以看到删除孩子的选项。\
    \
    \n8.“粉丝团”是什么？和“家人”有什么区别？\n\
    \
    “家人”是孩子whereIcome的管理者，可以查看到所有瞬间，并可以共同编辑和管理孩子的“whereIcome”。而“粉丝团”是孩子成长的关注者，由家人授权，只能查看和评论您孩子“非隐私”的瞬间。\
    \
    \n9.如何添加家人？\n\
    \
    手机APP中，进入小孩whereIcome首页，点击孩子头像下面的家人按钮，即可通过短信、邮件、或者微信发送邀请链接给家人。如果家人还没有下载whereIcome，收到邀请连接后，会跳转到下载whereIcome的页面，下载whereIcome后即可注册账号成为孩子家人。如果家人已经下载whereIcome，点击链接后会直接打开whereIcome，成为孩子家人。\
    \
    \n10.如何更改或者删除家人？\n\
    \
    进入whereIcome后，点击孩子头像下面的家人按钮，进入家人列表。点击想要更改或删除的家人名字，可以更改该家人与孩子的关系，将该家人设为粉丝，或者删除该家人。\
    \
    \n11.如何添加粉丝？\n\
    \
    手机APP中，进入小孩whereIcome首页，点击孩子头像下面的粉丝按钮，即可通过短信、邮件、或者微信发送邀请链接。如果被邀请的人还没有下载whereIcome，收到邀请连接后，会跳转到下载whereIcome的页面，下载whereIcome后即可注册账号成为孩子的粉丝。如果被邀请的人已经下载whereIcome，点击链接后会直接打开whereIcome，成为孩子粉丝。\
    \
    \n12.如何将粉丝移动到家人或者删除粉丝？\n\
    \
    进入whereIcome后，点击孩子头像下面的粉丝按钮，进入粉丝列表。点击想要更改或删除的粉丝名字，可以更将该粉丝设为家人，或者删除该粉丝。\
    \
    \n13.我可以在电脑网页上访问孩子的whereIcome吗？\n\
    \
    可以的。通过如下两种方式可以在电脑上访问孩子的whereIcome。方式一，进入whereIcome的官网  http://shanghairuiyu.cn/ ，用您的用户名和密码登录whereIcome。方式二，在手机APP中设置孩子的专属网址，设置完成后，直接通过专属网址在电脑网页上访问孩子的whereIcome。\
    \
    \n14.孩子的专属网址是什么？如何设置？\n\
    \
    孩子的专属网址是“whereIcome”为您孩子生成的个人网站的地址。您可以通过它访问孩子的个人网站；也可以方便地让家人和朋友通过whereIcome地址看到孩子最新的成长。 如果您还未给孩子添加whereIcome地址，您可以在手机上的[孩子设置]页找到该功能，您可以通过点击孩子首页列表顶部的设置按钮，进入孩子设置页。\
    \
    \n15.“私密的”和“非隐私的”分别意味着什么？\n\
    \
    非隐私的：对所有可以查看孩子的“whereIcome”的人可见。\
    私密的：只对该孩子的家人可见\
    \
    \n16.我们上传到“whereIcome”的数据安全吗？\n\
    \
    我们视用户的数据安全为第一要务，用户上传的所有内容都储存在安全可靠的服务器上，并且每天都会进行备份，确保数据不会丢失。\
    \
    \n17.“whereIcome”能保护孩子数据的隐私吗？\n\
    \
    “whereIcome”中孩子的数据都是隐私的，只有您授权的人（包括家人、朋友、访客）才能查看。如果你希望某些数据只对家人可见，你可以将它们设置为“私密的”。 什么是“私密的”和“非隐私的”？\
    \
    \n18.可以将上传到“whereIcome”上的日记和照片备份到自己的电脑里吗？\n\
    \
    可以！您可以在手机上的[孩子设置]页找到备份功能（您可以通过点击孩子首页列表顶部的设置按钮，进入孩子设置页），能将所有您上传的内容导出到您的电脑里，并支持网页离线浏览。\
    \
    \n19.如果需要上传的照片在电脑里怎么办？\n\
    \
    您可以使用网页端管理和查看孩子的成长，网页端可以通过您孩子的专属网址(什么是专属网址？）或http://shanghairuiyu.cn访问。\
    \
    \n20.为什么我不能删除其他人上传的内容？\n\
    \
    只有创建者和孩子的父母有权限删除所有内容，其他家人只能删除自己上传的照片。\
    \
    \n21.“whereIcome”只支持安卓手机和iPhone吗？\n\
    \
    目前“whereIcome”除了Android和iPhone客户端之外，还有网页客户端（网页端可以通过您孩子的专属网址或http://shanghairuiyu.cn访问。）。在将来我们会努力支持更多平台。也欢迎您告诉我们你需要支持的平台。\
    \
    \n22.可以把我孩子的“whereIcome”打印成一本书吗？\n\
    \
    我们目前还不提供打印服务，但是将孩子的成长记录打印成册是我们今后的重点之一，我们会尽快支持的！敬请期待。\
    \
    \n23.如何让孩子的其他亲人共同记录孩子的成长？\n\
    \
    您可以在手机上通过多种方式邀请家人。被添加的家人接受邀请后，该家人就可以和您一起共同记录孩子的成长了。\
    \
    \n24.如果家人没有智能手机怎么办？\n\
    \
    他们可以使用网页端管理和查看孩子的成长，网页端可以通过您孩子的专属网址(什么是专属网址？）或http://shanghairuiyu.cn访问。\
    \
    \n25.如果上传照片的时间不正确怎么办？\n\
    \
    通常情况下，whereIcome可以读取照片的时间信息，自动排列在正确的位置上。如果照片经过其他软件的处理，可能会丢失时间信息，导致时间错误，这种情况下，你可以在上传之前或之后，在照片编辑里修改照片的日期。\
    \
    \n26.怎么找到并关注我的朋友的孩子？\n\
    \
    如果您的朋友也使用了“whereIcome”，您可以在[添加朋友的孩子]通过搜索朋友孩子全名找到他的孩子，并申请关注他的孩子。 如果您的朋友没有使用“whereIcome”，您可以在[添加朋友的孩子]邀请朋友加入。在他使用后，您就可以通过搜索关注他的孩子了。 您可以在首頁向右滑动，展开列表，看到“添加朋友的孩子”。\
    \
    \n27.不想收到通知，怎么办？\n\
    \
    您可以在[通用设置]中，设置手机通知和邮件通知是否发送。\
    \
    \n28.更换手机或退出账户，whereIcome里的数据会丢失吗？\n\
    \
    whereIcome里的数据都是安全隐私地保持在我们的服务器里的，同时会有多个备份。所以，更换手机、退出账户等任何情况都不会导致数据丢失的，您只需要记住登陆账号，重新登陆whereIcome就好了。\
    \
    \n29.我有其他问题，怎么办？\n\
    \
    我们欢迎您的任何意见和建议，您可以使用反馈功能，或者发送邮件到：ry@zgruiyu.com";
    
    [self.textView setText:str];
}

- (void)back:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    RYLog(@"agreement Vc dealloc");
}
@end
