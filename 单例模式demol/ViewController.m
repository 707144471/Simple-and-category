//
//  ViewController.m
//  单例模式demol
//
//  Created by 123 on 2017/6/26.
//  Copyright © 2017年 123. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+DELEGATE_demol.h"
#import "ShaoLin.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
@property (nonatomic,strong)AVPlayer *player;
@property(nonatomic,strong)AVPlayerItem *playerItem;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    NSString *str=[self string];//类别
    NSLog(@"str=====%@",str);
    ShaoLin *a=[ShaoLin hanXianSheng];//单利
    a.name=@"我是a的name的值";
    if (a.why) {
        NSLog(@"++++++是不是yes");
    }
    ShaoLin *b=[ShaoLin hanXianSheng];
    b.why=YES;
    NSLog(@"b.name====%@",b.name);
    NSLog(@"%@",a);
    NSLog(@"%@",b);
    
    if ([self whyIsYesAndNo]) {
        NSLog(@"-----是不是yes");
    }
    [self VideoPlayback];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)VideoPlayback{
     NSString *urlString =[[NSBundle mainBundle]pathForResource:@"keep" ofType:@"mp4"];
    //设置静音状态也可播放声音
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
    
    
    AVURLAsset *asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:urlString]];
    
     self.playerItem = [AVPlayerItem playerItemWithAsset: asset];
    
    self.player = [[AVPlayer alloc]initWithPlayerItem:self.playerItem];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame = self.view.frame;
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    [self.view.layer addSublayer:playerLayer];
    [_player play];

     [self.playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor=[UIColor whiteColor];
    btn.frame=CGRectMake(100, 20, 60, 30);
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setTitle:@"暂停" forState:UIControlStateNormal];
    [btn setTitle:@"继续" forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];

}
-(void)onButtonClick:(UIButton *)btn{
    btn.selected=!btn.selected;
    if (btn.selected) {
        [self.player pause];//暂停
    }else{
    [_player play];//开始(继续)
    }
    
}
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    
    
    // 播放完成后重复播放
    // 跳到最新的时间点开始播放
    [_player seekToTime:CMTimeMake(0, 1)];
    [_player play];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context

    {
       
        AVPlayerItem *playerItem=object;
        if ([keyPath isEqualToString:@"status"]) {
            AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
            if(status==AVPlayerStatusReadyToPlay){
                NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
            }
        }
        
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
