
//
//  RYMusicPlayViewController.m
//  WhereICome
//
//  Created by 安松林 on 15/6/10.
//  Copyright (c) 2015年 上海睿予科技有限公司. All rights reserved.
//

#import "RYMusicPlayViewController.h"
#import "MusicModel.h"

@interface RYMusicPlayViewController ()<UITableViewDataSource,UITableViewDelegate>
// 音乐播放状态
@property (readwrite) AudioStreamerState state;


@end

@implementation RYMusicPlayViewController

- (void)dealloc
{
#pragma mark 注销定时器
    _progressUpdateTimer = nil;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.musicArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self playMusic];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    _isClickPlayMode = YES;
    
    [self createBackgroundView];
    [self createButton];
    [self searchMusicIndex];
    [self startListening];
    [self addAnimation];

}

- (void)createBackgroundView
{
    // 添加背景大图片
    self.bigImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    _bigImage.image = [UIImage imageNamed:@"more_music_pic"];
    _bigImage.alpha = 0.9;
    _bigImage.userInteractionEnabled = YES;

    [self.view addSubview:_bigImage];
    
    // 添加返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(20, 30, 12, 20);
    [backButton setBackgroundImage:[UIImage imageNamed:@"more_music_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_bigImage addSubview:backButton];
    
    // 添加收藏按钮
    UIButton *collectionButton = [UIButton buttonWithType:UIButtonTypeSystem];
    collectionButton.frame = CGRectMake(kScreenW - 40, 20, 25.5, 24.5);
    [collectionButton setBackgroundImage:[UIImage imageNamed:@"more_music_collection"] forState:UIControlStateNormal];
    [collectionButton addTarget:self action:@selector(collectionButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_bigImage addSubview:collectionButton];
    
    // 旋转图片
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 100, kScreenW - 40, kScreenW - 40)];
    _imgView.alpha = 0.8;
    _imgView.image = [UIImage imageNamed:@"more_music_yuantu"];
    [self.bigImage addSubview:_imgView];
    
#pragma mark -
#pragma mark 创建UITableView用来显示歌词
    self.tableView = [[UITableView  alloc] initWithFrame:CGRectMake(40, 100 + _imgView.frame.size.height / 4, _imgView.frame.size.width - 40, _imgView.frame.size.width/ 2) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _tableView.alpha = 0.4;
    [_bigImage addSubview:_tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)createButton
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenH - 110, kScreenW, 1)];
    label.backgroundColor = [UIColor grayColor];
    [_bigImage addSubview:label];
    
    
    /// 播放按钮
    self.playButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _playButton.frame = CGRectMake((kScreenW - 178) / 2 + 80, kScreenH - 92, 17.5, 21);
    [_playButton addTarget:self action:@selector(playMusicAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playButton];
    AudioManager * share = [AudioManager shareInstance];
    // 此歌曲正在播放或暂停
    if ([share.musicId isEqualToString:_mid]) {
        if (share.audioPlayer.state == AS_PLAYING) {
            self.musicPlayState = MusicPlayStateStart;
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_stop"] forState:UIControlStateNormal];
            
        } else if (share.audioPlayer.state == AS_STOPPED) {
            NSLog(@"stopped");
            self.musicPlayState = MusicPlayStatePause;
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_play"] forState:UIControlStateNormal];
        }
    }
    // 未有歌曲播放
    else if ([share.musicId isEqualToString:@"-1"]) {
        self.musicPlayState = MusicPlayStateNone;
        [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_play"] forState:UIControlStateNormal];
    }
    // 其他歌曲在播放
    else {
        self.musicPlayState = MusicPlayStateOtherPlaying;
        [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_play"] forState:UIControlStateNormal];
    }
    
#pragma mark-
#pragma mark 控制播放进度的控制条
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, kScreenH - 50, kScreenW - 120, 10)];
    
    [_progressSlider addTarget:self action:@selector(progressSliderAction:) forControlEvents:UIControlEventValueChanged];
    [_progressSlider addTarget:self action:@selector(progressSliderUp:) forControlEvents:UIControlEventTouchUpInside];
    [_progressSlider addTarget:self action:@selector(progressSliderDown:) forControlEvents:UIControlEventTouchDown];
    [_progressSlider setThumbImage:[UIImage imageNamed:@"more_music_slider"] forState:UIControlStateNormal];
    [self.view addSubview:self.progressSlider];
    // 创建音乐已播放时间
    self.labelTimePlay = [[UILabel alloc] initWithFrame:CGRectMake(20, kScreenH - 50, 40, 10)];
    _labelTimePlay.font = [UIFont systemFontOfSize:15];
    _labelTimePlay.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:_labelTimePlay];
    
    // 创建音乐总时长
    self.labelAllTime = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW - 60, kScreenH - 50, 40, 10)];
    _labelAllTime.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_labelAllTime];
    
    /// 上一首按钮
    UIButton *lastButton = [UIButton buttonWithType:UIButtonTypeSystem];
    lastButton.frame = CGRectMake((kScreenW - 178) / 2,kScreenH - 90, 28, 17);
    [lastButton setBackgroundImage:[UIImage imageNamed:@"more_music_up"] forState:UIControlStateNormal];
    [lastButton addTarget:self action:@selector(lastButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lastButton];
    
    /// 下一首按钮
    UIButton *lowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    lowButton.frame = CGRectMake(kScreenW / 2 + 61,kScreenH - 90, 28, 17);
    [lowButton setBackgroundImage:[UIImage imageNamed:@"more_music_next"] forState:UIControlStateNormal];
    [lowButton addTarget:self action:@selector(lowButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lowButton];
}

// 返回按钮点击事件
- (void)backButtonAction
{
#warning 退出当前页面时,停止播放音乐
    AudioManager * share = [AudioManager shareInstance];
    [share.audioPlayer stop];
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 收藏按钮点击事件
- (void)collectionButtonAction
{
    NSLog(@"呃呃呃");
}
// 播放按钮触发的点击事件   音乐开始播放
- (void)playMusicAction
{
    [self playMusic];
}

// 查询歌曲在数组中位置
- (void)searchMusicIndex
{
    int count = (int)[_musicArray count];
    for (int i = 0; i < count; i ++) {
        MusicModel * element = [_musicArray objectAtIndex:i];
        if ([_mid isEqualToString:element.musicID]) {
            self.playingIndex = i;
            break;
        }
    }
}

// 上一首按钮触发事件
- (void)lastButtonAction
{
    // 当 当前播放歌曲为第一首时. 提示...
    if (self.playingIndex == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"已经没有上一首了" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
        
    } else {
        self.playingIndex--;
        MusicModel * playDic = [_musicArray objectAtIndex:self.playingIndex];
        _mid = playDic.musicID;
        _music = playDic;
        //切换所有页面内容
        _musicPlayState = MusicPlayStateOtherPlaying; //播放状态是其他音乐正在播放
        [self playMusic];
        
        if (_musicPlayState == MusicPlayStateStart) {
            _musicPlayState = MusicPlayStateOtherPlaying;
        }
        else if (_musicPlayState == MusicPlayStateOtherPlaying)
        {
            _musicPlayState = MusicPlayStateStart;
        }
        else if (_musicPlayState == MusicPlayStatePause) {
            _musicPlayState = MusicPlayStateOtherPlaying;
            return;
        }
        else {
            return;
        }
    }
}

// 下一首点击事件触发方法
- (void)lowButtonAction
{
    int count = (int)[_musicArray count]; //获取歌曲个数
    if (self.playingIndex == count - 1) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"已经没有下一首了" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else {
        self.playingIndex ++;
        [self aaa];
    }
}
- (void)aaa
{
    MusicModel * playDic = [_musicArray objectAtIndex:self.playingIndex];
    _mid = playDic.musicID;
    _music = playDic;
    //切换所有页面内容
    _musicPlayState = MusicPlayStateOtherPlaying; //播放状态是其他音乐正在播放
    [self playMusic];
    
    if (_musicPlayState == MusicPlayStateStart) {
        _musicPlayState = MusicPlayStateOtherPlaying;
    }
    else if (_musicPlayState == MusicPlayStateOtherPlaying)
    {
        _musicPlayState = MusicPlayStateStart;
    }
    else if (_musicPlayState == MusicPlayStatePause) {
        _musicPlayState = MusicPlayStateOtherPlaying;
        return;
    }
    else {
        return;
    }
    
}

- (void)playMusic
{
    AudioManager * share = [AudioManager shareInstance];
    switch (_musicPlayState) {
        case MusicPlayStateStart:
        {
            [share.audioPlayer pause];
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_play"] forState:UIControlStateNormal];
            _musicPlayState = MusicPlayStatePause;
            [self stopAnimation];
        }
            break;
        case MusicPlayStatePause:
        {
            [share.audioPlayer start];
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_stop"] forState:UIControlStateNormal];
            _musicPlayState = MusicPlayStateStart;
            [self playAnimation];
        }
            break;
        case MusicPlayStateNone:
        {
            share.audioPlayer = [[AudioStreamer alloc] initWithURL:[NSURL URLWithString:self.music.strUrl]];
            [share.audioPlayer start];
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_stop"] forState:UIControlStateNormal];
            _musicPlayState = MusicPlayStateStart;
            share.musicId = _mid;
            [self createTimers:YES];
            [self playAnimation];
        }
            break;
        case MusicPlayStateOtherPlaying:
        {
            [share.audioPlayer stop];
            share.audioPlayer = [[AudioStreamer alloc] initWithURL:[NSURL URLWithString:self.music.strUrl]];
            [share.audioPlayer start];
            [_playButton setBackgroundImage:[UIImage imageNamed:@"more_music_stop"] forState:UIControlStateNormal];
            _musicPlayState = MusicPlayStateStart;
            share.musicId = _mid;
            [self createTimers:YES];
            [self playAnimation];
        }
            break;
        default:
            break;
    }
}
// 创建定时器 监听播放时间
-(void)createTimers:(BOOL)create
{
    if (create) {
        {
            [self createTimers:NO];
            // 每0.1秒触发方法
            self.progressUpdateTimer =
            [NSTimer
             scheduledTimerWithTimeInterval:0.1
             target:self
             selector:@selector(updateProgress:)
             userInfo:nil
             repeats:YES];
        }
    } else {
        if (_progressUpdateTimer)
        {
            [_progressUpdateTimer invalidate];
            _progressUpdateTimer = nil;
        }
    }
}
- (void)updateProgress:(NSTimer *)updatedTimer
{
    AudioManager * share = [AudioManager shareInstance];
    if (share.audioPlayer.bitRate!= 0.0)
    {
        // 当前进度
        double progress = share.audioPlayer.progress;
        // 歌曲总长
        double duration = share.audioPlayer.duration;
        if (duration > 0)
        {
            [_progressSlider setEnabled:YES];
            [_progressSlider setValue:progress / duration];
            // 把歌曲时间赋值给UILabel控件显示出来
            _labelTimePlay.text = [NSString stringWithFormat:@"%f", share.audioPlayer.progress];
            _labelAllTime.text = [NSString stringWithFormat:@"%f", share.audioPlayer.duration];
            if ((int)share.audioPlayer.progress % 60 < 10) {
                _labelTimePlay.text = [NSString stringWithFormat:@"0%d:0%d",(int)share.audioPlayer.progress / 60, (int)share.audioPlayer.progress % 60];
            } else {
                _labelTimePlay.text = [NSString stringWithFormat:@"0%d:%d",(int)share.audioPlayer.progress / 60, (int)share.audioPlayer.progress % 60];
            }
            if ((int)share.audioPlayer.duration % 60 < 10) {
                _labelAllTime.text = [NSString stringWithFormat:@"0%d:0%d",(int)share.audioPlayer.duration / 60, (int)share.audioPlayer.duration % 60];
            } else {
                _labelAllTime.text = [NSString stringWithFormat:@"0%d:%d",(int)share.audioPlayer.duration / 60, (int)share.audioPlayer.duration % 60];
            }
            
        } else {
            [_progressSlider setEnabled:NO];
        }
    }
   
}


// 播放进度条的点击事件
- (void)progressSliderAction:(UISlider *)sender {
    AudioManager * share = [AudioManager shareInstance];
    double duration = share.audioPlayer.duration;
    double progress = sender.value;
    progress *= duration;
    [share.audioPlayer seekToTime:progress];
}
- (void)progressSliderDown:(UISlider *)sender {
    [_progressUpdateTimer invalidate]; //内存管理
}
- (void)progressSliderUp:(UISlider *)sender {
    AudioManager * share = [AudioManager shareInstance];
    double duration = share.audioPlayer.duration;
    double progress = sender.value;
    progress *= duration;
    [share.audioPlayer seekToTime:progress];
    [self createTimers:YES];
    [_progressUpdateTimer fire];
}

#pragma mark -
#pragma mark 监听歌曲是否播放完成
- (void)startListening
{
    // 监听歌曲是播放完成
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self selector:@selector(stateChange:) name:@"ASStatusChangedNotification" object:nil];
}
///  改变状态
- (void)stateChange:(NSNotification *)nc
{
    NSLog(@"%@", [nc.userInfo objectForKey:@"state"]);
    if ([[nc.userInfo objectForKey:@"state"] isEqualToString:@"8"]) {
        NSLog(@"播放结束");
        //        _musicPlayState = MusicPlayStateOtherPlaying;
        //        _playingIndex++;
        //        MusicModel * playDic = [_tableArray objectAtIndex:self.playingIndex];
        //        _mid = playDic.musicID;
        //        _music = playDic;
        //        _musicPlayState = MusicPlayStateOtherPlaying; //播放状态是其他音乐正在播放
        [self lowButtonAction];
    }
}


/// 旋转动画
- (void)playAnimation
{
    self.imgView.layer.speed = 0.2;
    self.imgView.layer.beginTime = 0.0;
    CFTimeInterval pausedTime = [self.imgView.layer timeOffset];
    CFTimeInterval timeSincePause = [self.imgView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    self.imgView.layer.beginTime = timeSincePause;
    
}
///  动画停止
- (void)stopAnimation
{
    CFTimeInterval pausedTime = [self.imgView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.imgView.layer.speed = 0.0;
    self.imgView.layer.timeOffset = pausedTime;
}
/// 添加动画
- (void)addAnimation
{
    CABasicAnimation *monkeyAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    monkeyAnimation.toValue = [NSNumber numberWithFloat:2.0 *M_PI];
    monkeyAnimation.duration = 6.0f;
    monkeyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    monkeyAnimation.cumulative = NO;
    monkeyAnimation.removedOnCompletion = NO; //No Remove
    monkeyAnimation.repeatCount = FLT_MAX;
    [self.imgView.layer addAnimation:monkeyAnimation forKey:@"AnimatedKey"];
    [self.imgView stopAnimating];
    self.imgView.layer.speed = 0.0;
}

#pragma mark -
#pragma mark 加载歌词页面
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//该表格选中后没有颜色
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"忍不住化身一条孤独的鱼,就这样孤独到底";
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
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
