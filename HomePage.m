//
//  HomePage.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/19.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HomePage : UIViewController<UIScrollViewDelegate>{
    
    IBOutlet UILabel *message;
    IBOutlet UIScrollView *myScrollView;
    IBOutlet UIPageControl *myPageControl;
}
- (IBAction)sureButton:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UILabel *message;
@property (retain, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (retain, nonatomic) IBOutlet UIPageControl *myPageControl;

@end

@implementation HomePage
@synthesize message,myScrollView,myPageControl;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    int pageCount = 3;
    
    CGRect scrollViewRect = [self.view bounds];
    //create scrollview
    myScrollView.pagingEnabled = YES;
    myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * pageCount,1);
    myScrollView.showsHorizontalScrollIndicator = NO;
    myScrollView.showsVerticalScrollIndicator = NO;
    myScrollView.delegate = self;
    
    
    
    myPageControl.backgroundColor = [UIColor clearColor];
    myPageControl.numberOfPages = pageCount;
    myPageControl.currentPage = 0;
    [myPageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    //create pages
    //NSArray * colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor purpleColor] ];
    for (int i = 0; i < 3; i ++) {
        UIImageView * aView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(myScrollView.bounds))];
        aView.center = CGPointMake(CGRectGetMidX(self.view.bounds) + i * CGRectGetWidth(self.view.bounds), CGRectGetMidY(myScrollView.bounds));
        aView.image = [UIImage imageNamed:[NSString stringWithFormat:@"artist%d.png",i+1]];
        // Begin a new image that will be the new image with the rounded corners
        // (here with the size of an UIImageView)
//        UIGraphicsBeginImageContextWithOptions(aView.bounds.size, NO, 1.0);
//        
//        // Add a clip before drawing anything, in the shape of an rounded rect
//        [[UIBezierPath bezierPathWithRoundedRect:aView.bounds
//                                    cornerRadius:5.0] addClip];
//        // Draw your image
//        [aView.image drawInRect:aView.bounds];
//        
//        // Get the image, here setting the UIImageView image
//        aView.image = UIGraphicsGetImageFromCurrentImageContext();
//        
//        // Lets forget about that we were drawing
//        UIGraphicsEndImageContext();
        //aView.backgroundColor = colors[i];
        aView.contentMode = UIViewContentModeScaleAspectFit;
        [myScrollView addSubview:aView];
    }
    
    
    
    
}


#pragma mark 图片切换
- (void)loadScrollViewWithPage:(UIView *)page
{
    long pageCount = [[myScrollView subviews] count];
    
    CGRect bounds = myScrollView.bounds;
    bounds.origin.x = bounds.size.width * pageCount;
    bounds.origin.y = 0;
    page.frame = bounds;
    [myScrollView addSubview:page];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = sender.frame.size.width;
    int page = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    myPageControl.currentPage = page;
    
    
    if(page==0){
        message.text=@"fox1";
    }
    if(page==1){
        message.text=@"fox2";
    }
    if(page==2){
        message.text=@"fox3";
    }
    
    
}

- (void)changePage:(id)sender
{
    long page = myPageControl.currentPage;
    
    if (page == 0) {
        self.message.text = @"fox1";
    }else if (page == 1) {
        self.message.text = @"fox2";
    }else {
        self.message.text = @"fox3";
    }
    
    
    
    // update the scroll view to the appropriate page
    CGRect frame = myScrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [myScrollView scrollRectToVisible:frame animated:YES];
}
- (IBAction)sureButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"关闭2");
        
        
    }];
    
}
@end
