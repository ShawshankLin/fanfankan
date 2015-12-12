//
//  IntroduceViewController.h
//  LxsApp
//
//  Created by cxupx19 on 15/10/18.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroduceViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextView *articleText;
- (IBAction)closeButton:(UIButton *)sender;

@end
