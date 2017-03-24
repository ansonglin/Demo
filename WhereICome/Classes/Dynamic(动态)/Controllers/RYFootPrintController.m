//
//  RYFootPrintController.m
//  WhereICome
//
//  Created by mkq on 15/6/3.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//
#define kToolBarHeight  40

#import "RYFootPrintController.h"
#import "RYSelectToolBar.h"
#import "RYSelectView.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import "RYEmotionKeyboard.h"
#import "RYComposeToolbar.h"
#import "RYEmotion.h"
#import "RYEmotionTextView.h"
#import "RYLocationController.h"
#import "RYAuthorityController.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoAssets.h"

@interface RYFootPrintController ()<UITextViewDelegate,RYSelectViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,RYComposeToolbarDelegate,RYAuthorityControllerDelegate,RYLocationControllerDelegate,ZLPhotoPickerViewControllerDelegate>
/**
 *  文本框
 */
@property (nonatomic, weak) RYEmotionTextView *textView;
/**
 *  选择工具条
 */
//@property (nonatomic, weak) UIView *toolbar;
/**
 *  地址栏
 */
@property (nonatomic, weak)RYSelectView *adressView;
/**
 *  权限栏
 */
@property (nonatomic, weak)RYSelectView *authorView;

/**
 *  照片/录像 视图控制器
 */
@property (nonatomic, strong)UIImagePickerController *picker;
/**
 *  表情栏
 */
@property (nonatomic, strong)RYEmotionKeyboard *keyBoard;

/**
 *  是否正在切换键盘
 */
@property (nonatomic, assign, getter = isChangingKeyboard) BOOL changingKeyboard;

/**
 *  工具栏
 */
@property (nonatomic, weak)RYComposeToolbar *composeToolbar;

@end

@implementation RYFootPrintController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RYColor(242, 242, 242);
    //配置导航栏
    [self configNav];
    //创建文本框
    [self setupTextView];
    //选择工具栏
//    [self setupSelectToolBar];
    //地点
    [self setupAdress];
    //权限
    [self setupAuthor];
    //选择工具栏
    [self setupComposeToolBar];
    
    
}
- (void)configNav
{
    //左按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [btn setImage:[UIImage imageNamed:@"return_black"] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(back) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //右按钮
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitle:@"发布" forState:(UIControlStateNormal)];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(issue) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

- (void)setupAdress
{
    NSInteger adressX = 0;
    NSInteger adressY = CGRectGetMaxY(self.textView.frame)+1;
    CGRect adressFrame = CGRectMake(adressX, adressY, kScreenW, kToolBarHeight);
    RYSelectView *addressSelectView = [RYSelectView selectViewWithFrame:adressFrame];
    [addressSelectView.detailLabel setText:@"地点"];
    [addressSelectView.subLabel setText:@"地点"];
    addressSelectView.delegate = self;
    [self.view addSubview:addressSelectView];
    self.adressView = addressSelectView;
    
    
}

- (void)setupAuthor
{
    NSInteger AuthorX = 0;
    NSInteger AuthorY = CGRectGetMaxY(self.adressView.frame)+1;
    CGRect AuthorFrame = CGRectMake(AuthorX, AuthorY, kScreenW, kToolBarHeight);
    RYSelectView *AuthorSelectView = [RYSelectView selectViewWithFrame:AuthorFrame];
    [AuthorSelectView.detailLabel setText:@"权限"];
    [AuthorSelectView.subLabel setText:@"公开"];
    AuthorSelectView.delegate = self;
    [self.view addSubview:AuthorSelectView];
    self.authorView = AuthorSelectView;
    
}
/*
- (void)setupSelectToolBar
{
    NSInteger toolBarX = 0;
    NSInteger toolBarY = CGRectGetMaxY(self.textView.frame)+1;
    CGRect toolBarFrame = CGRectMake(toolBarX, toolBarY, kScreenW, kToolBarHeight);
    UIView *selectBar = [[UIView alloc] initWithFrame:toolBarFrame];
    selectBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:selectBar];
    self.toolbar = selectBar;
    //照片
    NSInteger cameraX = 15;
    NSInteger cameraY = 0;
    NSInteger cameraW = 30;
    NSInteger cameraH = kToolBarHeight;
    CGRect cameraFrame = CGRectMake(cameraX, cameraY, cameraW, cameraH);
    UIButton *camera = [self setUpBtnWithImage:@"camera" frame:cameraFrame Sel:@selector(cameraBtnClick:)];;
    [self.toolbar addSubview:camera];
    //摄影
    NSInteger videoX = CGRectGetMaxX(cameraFrame) + 20;
    NSInteger videoY = 0;
    NSInteger videoW = 30;
    NSInteger videoH = kToolBarHeight;
    CGRect videoFrame = CGRectMake(videoX, videoY, videoW, videoH);
    UIButton *video = [self setUpBtnWithImage:@"video" frame:videoFrame Sel:@selector(videoBtnClick:)];;
    [self.toolbar addSubview:video];
    //表情
    NSInteger faceX = CGRectGetMaxX(videoFrame) + 20;
    NSInteger faceY = 0;
    NSInteger faceW = 30;
    NSInteger faceH = kToolBarHeight;
    CGRect faceFrame = CGRectMake(faceX, faceY, faceW, faceH);
    UIButton *face = [self setUpBtnWithImage:@"face" frame:faceFrame Sel:@selector(faceBtnClick:)];
    [self.toolbar addSubview:face];
    
}
*/
- (UIButton *)setUpBtnWithImage:(NSString *)image frame:(CGRect)frame Sel:(SEL)sel
{
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = frame;
    [btn setImage:[UIImage imageNamed:image] forState:(UIControlStateNormal)];
    [btn addTarget:self action:sel forControlEvents:(UIControlEventTouchUpInside)];
    return btn;
}
- (void)setupComposeToolBar
{
    // 1.创建
    RYComposeToolbar *toolbar = [[RYComposeToolbar alloc] init];
//    toolbar.backgroundColor = [UIColor redColor];
    toolbar.delegate = self;
    NSInteger cc = kScreenH - 44;
    toolbar.frame = CGRectMake(0, cc, kScreenW, 44);
    [self.view addSubview:toolbar];
    self.composeToolbar = toolbar;
    
    // 监听表情选中的通知
    [RYNotificationCenter addObserver:self selector:@selector(emotionDidSelected:) name:RYEmotionDidSelectedNotification object:nil];
    // 监听删除按钮点击的通知
    [RYNotificationCenter addObserver:self selector:@selector(emotionDidDeleted:) name:RYEmotionDidDeletedNotification object:nil];
   
}
/**
 *  添加textView
 */
- (void)setupTextView
{
    // 1.添加
    RYEmotionTextView *textView = [[RYEmotionTextView alloc] init];
    textView.font = [UIFont systemFontOfSize:15];
    NSInteger textViewX = 0;
    NSInteger textViewY = 0;
    NSInteger textViewW = kScreenW - 2*textViewX;
    NSInteger textViewH = 164;
    textView.frame = CGRectMake(textViewX, textViewY, textViewW, textViewH);
//    textView.backgroundColor = [UIColor redColor];
    // 垂直方向上永远可以拖拽
    textView.alwaysBounceVertical = YES;
    textView.delegate = self;
    textView.placeholder = @"说点什么吧...";
    [self.view addSubview:textView];
    self.textView = textView;
    // 2.监听textView文字改变的通知
//    [RYNotificationCenter addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:textView];
    // 4.监听键盘
    // 键盘的frame(位置)即将改变, 就会发出UIKeyboardWillChangeFrameNotification
    // 键盘即将弹出, 就会发出UIKeyboardWillShowNotification
    [RYNotificationCenter addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    // 键盘即将隐藏, 就会发出UIKeyboardWillHideNotification
    [RYNotificationCenter addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

/**
 *  当textView的文字改变就会调用
 */
- (void)textViewDidChange:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem.enabled = textView.hasText;
}

- (void)setupKeyBoard
{
    // 正在切换键盘
    self.changingKeyboard = YES;
    
    if (self.textView.inputView) { // 当前显示的是自定义键盘，切换为系统自带的键盘
        self.textView.inputView = nil;
        
        // 显示表情图片
        self.composeToolbar.showEmotionButton = YES;
    } else { // 当前显示的是系统自带的键盘，切换为自定义键盘
        // 如果临时更换了文本框的键盘，一定要重新打开键盘
        self.textView.inputView = self.keyBoard;
        
        // 不显示表情图片
        self.composeToolbar.showEmotionButton = NO;
    }
    
    // 关闭键盘
    [self.textView resignFirstResponder];
    
#warning 记录是否正在更换键盘
    // 更换完毕完毕
    self.changingKeyboard = NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 打开键盘
        [self.textView becomeFirstResponder];
    });
}
/**
 *  初始化照相机
 */
- (void)setUpCamera
{
    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //kUTTypeImage 对应拍照     kUTTypeMovie  对应摄像
        self.picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeImage, nil];
        
        [self presentViewController:self.picker animated:YES completion:nil];
    }
}
/**
 *  初始化视频
 */
- (void)setUpVideo
{
    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //kUTTypeImage 对应拍照     kUTTypeMovie  对应摄像
        self.picker.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)kUTTypeMovie, nil];
        [self presentViewController:self.picker animated:YES completion:nil];
    }
}
/**
 *  初始化相册
 */
- (void)setUpAlbum
{
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc] init];
    // 默认显示相册里面的内容SavePhotos
    pickerVc.status = PickerViewShowStatusCameraRoll;
    // 选择图片的最小数，默认是9张图片
    pickerVc.minCount = 6;
    // 设置代理回调
    pickerVc.delegate = self;
    // 展示控制器
    [pickerVc show];
//    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeSavedPhotosAlbum)]) {
//        self.picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//        [self presentViewController:self.picker animated:YES completion:nil];
//    }
}

#pragma mark ZLPhotoPickerViewControllerDelegate
/**
 *  返回所有的Asstes对象
 */
- (void)pickerViewControllerDoneAsstes:(NSArray *)assets
{
    for (ZLPhotoAssets *photoAssert in assets) {
        NSLog(@"%@",photoAssert);
    }
}
/**
 *  点击拍照
 */
- (void)pickerCollectionViewSelectCamera:(ZLPhotoPickerViewController *)pickerVc
{
    NSLog(@"%@",pickerVc);
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    RYLog(@"%@",editingInfo);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSString *mediaType = [editingInfo objectForKey: UIImagePickerControllerMediaType];
    
    if (mediaType) {
        //照片
        if (CFStringCompare((CFStringRef)mediaType , kUTTypeImage, 0) == kCFCompareEqualTo) {
            RYLog(@"照片拍摄");
        }else if (CFStringCompare((CFStringRef)mediaType, kUTTypeVideo, 0) == kCFCompareEqualTo){//录像
            RYLog(@"录像");
        }
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 懒加载

- (UIImagePickerController *)picker
{
    if (nil == _picker) {
        _picker = [[UIImagePickerController alloc] init];
        _picker.delegate = self;
        _picker.allowsEditing = YES;
//        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    return _picker;
}

- (RYEmotionKeyboard *)keyBoard
{
    if (nil == _keyBoard) {
        _keyBoard = [RYEmotionKeyboard keyboard];
        _keyBoard.width = kScreenW;
        
        //iPhone6+ 键盘高271  iPhone6 258  其他216
        _keyBoard.height = 216;
        
    }
    return _keyBoard;
}

#pragma mark  RYSelectViewDelegate
- (void)selectView:(RYSelectView *)selectView didClick:(UITapGestureRecognizer *)tap
{
//    RYLog(@"%@",tap);
    if (selectView == self.adressView) {
//        RYLog(@"地点");
        RYLocationController *locationVc = [[RYLocationController alloc] initWithNibName:@"RYLocationController" bundle:nil];
        locationVc.delegate = self;
        locationVc.view.y = kScreenH;
//        [UIView animateWithDuration:0.25 animations:^{
            locationVc.view.y = 0;
            [self.navigationController pushViewController:locationVc animated:YES];
//        }];
//        [self.navigationController pushViewController:locationVc animated:YES];
        
    }else if (selectView == self.authorView){
//        RYLog(@"权限");
        RYAuthorityController *authorVc = [[RYAuthorityController alloc] initWithNibName:@"RYAuthorityController" bundle:nil];
        authorVc.view.y = kScreenH;
        authorVc.delegate = self;
//        [UIView animateWithDuration:0.25 animations:^{
            authorVc.view.y = 0;
            [self.navigationController pushViewController:authorVc animated:YES];
//        }];
        
    }
}

#pragma mark  RYAuthorityControllerDelegate
/**
 *  返回选中的权限
 */
- (void)authorityController:(RYAuthorityController *)controller WithSelectAuthor:(NSString *)authorString
{
    UILabel *author = self.authorView.subLabel;
    if (authorString) {
        [author setText:authorString];
        [self.authorView setNeedsLayout];
    }
}
#pragma mark RYLocationControllerDelegate
- (void)locationController:(RYLocationController *)locationController withLoctionString:(NSString *)locStr
{
    UILabel *locLabel = self.adressView.subLabel;
    if (locStr) {
        [locLabel setText:locStr];
        [self.adressView setNeedsLayout];
    }
}
#pragma  RYComposeToolbarDelegate

- (void)composeTool:(RYComposeToolbar *)toolbar didClickedButton:(RYComposeToolbarButtonType)buttonType
{
    switch (buttonType) {
        case RYComposeToolbarButtonTypeCamera: // 照相机
            [self setUpCamera];
            break;
            
        case RYComposeToolbarButtonTypePicture: // 相册
            [self setUpAlbum];
            break;
            
        case RYComposeToolbarButtonTypeVideo: // 录像
            [self setUpVideo];
            break;
            
        case RYComposeToolbarButtonTypeEmotion: // 表情
            [self setupKeyBoard];
            break;
            
        default:
            break;
    }
}

/**
 *  当表情选中的时候调用
 *
 *  @param note 里面包含了选中的表情
 */
- (void)emotionDidSelected:(NSNotification *)note
{
    RYEmotion *emotion = note.userInfo[RYSelectedEmotion];
    // 1.拼接表情
    [self.textView appendEmotion:emotion];
    
    // 2.检测文字长度
    [self textViewDidChange:self.textView];
}

/**
 *  当点击表情键盘上的删除按钮时调用
 */
- (void)emotionDidDeleted:(NSNotification *)note
{
    // 往回删
    [self.textView deleteBackward];
//    RYLog(@"删除1个......");
}


- (void)issue
{
    RYLog(@"发布");
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 键盘退出
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.textView isFirstResponder]) {
        [self.textView resignFirstResponder];
    }
    
}
#pragma mark - 键盘处理
/**
 *  键盘即将隐藏
 */
- (void)keyboardWillHide:(NSNotification *)note
{
    if (self.isChangingKeyboard) return;
    
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        self.composeToolbar.transform = CGAffineTransformIdentity;
    }];
}

/**
 *  键盘即将弹出
 */
- (void)keyboardWillShow:(NSNotification *)note
{
    // 1.键盘弹出需要的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    //iPhone6+ 键盘高271  iPhone6 258  其他216
    // 2.动画
    [UIView animateWithDuration:duration animations:^{
        // 取出键盘高度
        CGRect keyboardF = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
        CGFloat keyboardH = keyboardF.size.height;
        self.composeToolbar.transform = CGAffineTransformMakeTranslation(0, - keyboardH);
    }];
}

- (void)dealloc
{
    [RYNotificationCenter removeObserver:self];
}

@end
