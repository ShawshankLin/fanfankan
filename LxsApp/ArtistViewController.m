//
//  ArtistViewController.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/17.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import "ArtistViewController.h"
#import "IntroduceViewController.h"

@interface ArtistViewController ()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray * artistImages;
//全局变量 记录翻转编号
@property (assign,nonatomic) NSInteger index;
@property (strong,nonatomic)NSTimer * timer;
@property (strong,nonatomic)NSArray * dataSource;
//执行动画效果方法
-(void)startImageAnimation;
@end

@implementation ArtistViewController
//视图显示启动
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    if(_timer){
        _timer.fireDate=[NSDate date];
    }
}
//视图关闭启用
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
    //停止计时器
    //第一种：暂停（失活状态）
    //第二种：停止（从运行池中进行移除）
    if(_timer){
        _timer.fireDate=[NSDate distantFuture];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //启动计时器 NSTimer
    //参数1：时间间隔（以秒作为单位）
    //参数2：目标（一般为self）
    //参数3：选择器（选择执行某个方法）
    //参数4：附加参数，一般为nil
    //参数5：重复
    _timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startImageAnimation) userInfo:nil repeats:YES];
    NSString * path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"artist.plist"];
    _dataSource=[[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"wwww%@",_dataSource);;
    for (int i=1; i<=12; i++) {
       UIImageView * image = (UIImageView *)_artistImages[i-1];
        NSLog(@"WWW%@",[NSString stringWithFormat:@"artist%d.png",i]);
        image.image=[UIImage imageNamed:[NSString stringWithFormat:@"artist%d.png",i]];
    }
}
-(void)startImageAnimation{
    //得到下标方式
    NSInteger i=_index++%_artistImages.count;
    //读取数组元素
    //得到按钮，并将它进行翻转
    NSLog(@"执行动画效果方法");
    //UIImageView * image =(UIImageView *)_artistImages[i];
    //NSLog(@"222%@",[NSString stringWithFormat:@"artist3%ld.png",(long)i]);
    UIImageView * image = (UIImageView *)_artistImages[i];
    //参数1：动画对象[NSString stringWithFormat:@"artist%ld.png",(long)i]
    //参数2：动画时长（以秒为单位）
    //参数3：动画参数
    //参数4：动画块
    [UIView transitionWithView:image duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        //不做任何操作
    } completion:^(BOOL finished) {
        //不做任何操作
    }];
    if (_index==12) {
        _index=0;
    }
    
    
    
}

#pragma mark-- 触摸翻转
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    //获得touch对象（一个触摸的点）
    UITouch * touch=[touches anyObject];
    //[touch locationInView:<#(nullable UIView *)#>]
    //touch isKindOfClass:<#(__unsafe_unretained Class)#>
    //touch isMemberOfClass:<#(__unsafe_unretained Class)#>
    if(touch.view.tag>=100&&touch.view.tag<=111){
        IntroduceViewController * introduceViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"introduceView"];
        self.definesPresentationContext = YES; //self is presenting view controller
        introduceViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        introduceViewController.modalPresentationStyle = UIModalPresentationCustom;
        //NSLog([NSString stringWithFormat:@"artist%@", _dataSource[touch.view.tag%100]);
        introduceViewController.nameLabel.text=_dataSource[touch.view.tag%100][@"name"];
        introduceViewController.headImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"artist%ld.png", (touch.view.tag%100)+1]];
        introduceViewController.articleText.text=_dataSource[touch.view.tag%100][@"article"];
        [self presentViewController:introduceViewController animated:NO completion:nil];
    }
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
