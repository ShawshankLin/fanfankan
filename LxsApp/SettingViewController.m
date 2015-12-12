//
//  SettingViewController.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/17.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import "SettingViewController.h"
//音频视频提供框架
#import <AVFoundation/AVFoundation.h>
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *userAvatar;
@property (nonatomic,strong) NSMutableArray * dataSource;//代表数据源
@property(strong,nonatomic) AVAudioPlayer * audioPlayer;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Get your image somehow
    UIImage *image = [UIImage imageNamed:@"userAvatar@2x.png"];
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(_userAvatar.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:_userAvatar.bounds
                                cornerRadius:100.0] addClip];
    // Draw your image
    [image drawInRect:_userAvatar.bounds];
    
    // Get the image, here setting the UIImageView image
    _userAvatar.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    
    _dataSource=[[NSMutableArray alloc] init];
    for (int i=0; i<3; i++) {
        NSString * string = [NSString stringWithFormat:@"music%d.mp3",i];
        //将字符串放入数组
        [self.dataSource addObject:string];
    }
}

#pragma  mark --UITableViewDataSource 必要方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //从重用队列获得cell
    UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Music" forIndexPath:indexPath];
    cell.textLabel.text=self.dataSource[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld",indexPath.row);
    switch (indexPath.row+1) {
        case 1:
            [self loadMusic:1];
            break;
        case 2:
            [self loadMusic:2];
            break;
        case 3:
            [self loadMusic:3];
            break;
        default:
            break;
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark --初始化音频
-(void)loadMusic:(NSInteger)number{
    self.audioPlayer = ({
        NSString * fileName=[NSString stringWithFormat:@"music%ld",(long)number];
        NSString * musicPath=[[NSBundle mainBundle] pathForResource:fileName ofType:@"mp3"];
        NSURL * url=[NSURL URLWithString:musicPath];
        AVAudioPlayer *player=[[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [player prepareToPlay];
        player.numberOfLoops=-1;//无限循环
        //[player play];
        player;
    });
    [self.audioPlayer play];
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
