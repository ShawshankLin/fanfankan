//
//  LoginViewController.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/18.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import "LoginViewController.h"
#import "HomePage.h"

@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordLabel;
- (IBAction)loginButton:(UIButton *)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidDisappear:(BOOL)animated{
    NSLog(@"关闭了");
    //code data
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    UIAlertController * alertController=nil;
    UIAlertAction * sureAction=nil;
    NSString * message;
    if ([_usernameLabel.text isEqualToString:@"linxiaosheng"]&[_passwordLabel.text isEqualToString:@"123456"]) {
        //模态视图推送
        
        [self dismissViewControllerAnimated:YES completion:^{
//            HomePage * homePage = [self.storyboard instantiateViewControllerWithIdentifier:@"homePageView"];
//            [self presentViewController:homePage animated:NO completion:nil];
            
          
            
        }];
          [[NSNotificationCenter defaultCenter] postNotificationName:@"denglu" object:nil];
       
        //知识点
        //NSUserDefaults 属性列表（简单的数据持久化）
        //归档 NSKeyedArchiver 与反归档 NSFileManger
        
    }else{
        message=@"登陆失败";
        alertController=[UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        sureAction=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:sureAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
