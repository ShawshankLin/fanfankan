//
//  YRViewController.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/18.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import "YRViewController.h"

@interface YRViewController ()
{
    IBOutlet UIImageView *headImage;
    float width;
    float height;
    
    IBOutlet UIImageView *headImage2;
}
@end

@implementation YRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    width=40;
    height=40;
}

#pragma mark-- 触摸移动
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesMoved:touches withEvent:event];
    //获得touch对象（一个触摸的点）
    UITouch * touch=[touches anyObject];
     CGPoint touchPoint = [touch locationInView:self.view];
    NSLog(@"横%f",touchPoint.x);
     NSLog(@"纵%f",touchPoint.y);
    //tx是控件偏移的X坐标
    //ty是控件偏移的Y坐
    //这个Demo是实现了控件向下移动
    //int tx=self->headImage.transform.tx;
    //int ty=self->headImage.transform.ty+1;
    self->headImage.transform=CGAffineTransformMakeTranslation(touchPoint.x-150,20);
    if(touchPoint.x<100){
        headImage.hidden=YES;
        headImage2.hidden=NO;
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
     [super touchesBegan:touches withEvent:event];
    //全局变量
    
//    float sx=1.0,sy=1.0;
//    
//    //CGAffineTransformMakeScale 里面的参数sx,sy取值范围0-1,就是控件缩放大小，我这里定义的全局变量是为了改变控件大小而定义。
//    
//    sx+=0.1;
//    sy+=0.1;
    
    self->headImage.transform=CGAffineTransformMakeScale(1.2, 1.2);
    //定义全局变量float angle=0;
    
    //angele取值范围-1---0---1  就是控件旋转的角度
    
    //angle+=0.1;
    
    //self->headImage.transform=CGAffineTransformMakeRotation(0.1);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

}
@end
