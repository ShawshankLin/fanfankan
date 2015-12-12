//
//  ViewController.m
//  LxsApp
//
//  Created by cxupx19 on 15/10/17.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import "ViewController.h"
#import "ArticleTableViewCell.h"
#import "LoginViewController.h"
#import "HomePage.h"
//音频视频提供框架
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    BOOL _isLogin;
}
@property (nonatomic,strong) NSArray * dataSource;//代表数据源

- (void)loginSuccessed;
@end

@implementation ViewController

- (void)loginSuccessed
{
    NSLog(@"denglu chenggong");
    HomePage * homePage = [self.storyboard instantiateViewControllerWithIdentifier:@"homePageView"];
    [self presentViewController:homePage animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginSuccessed) name:@"denglu" object:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    //判断是否已经登陆 弹出登陆页面
    if (_isLogin) {
        return;
    }
    _isLogin=YES;
//    HomePage * homePage = [self.storyboard instantiateViewControllerWithIdentifier:@"homePageView"];
////    [self presentViewController:homePage animated:NO completion:nil];
//    [self.view addSubview:homePage.view];
    
    LoginViewController * loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
    self.definesPresentationContext = YES; //self is presenting view controller
    loginViewController.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    loginViewController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:loginViewController animated:YES completion:nil];
    
    
    
    //读取plist文件的数据
    NSString * path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"ScenicList.plist"];
    //配置数据源
    self.dataSource = [[NSArray alloc]initWithContentsOfFile:path];
    //调用背景音乐
    
    
}
#pragma  mark --UITableViewDataSource 必要方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //从重用队列获得cell
    ArticleTableViewCell * cell = (ArticleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Article" forIndexPath:indexPath];
    cell.nameLabel.text=self.dataSource[indexPath.row][@"name"];
    //NSLog(@"%@",[NSString stringWithFormat:@"%@",self.dataSource[indexPath.row][@"title"]]);
    cell.headImage.image=[UIImage imageNamed:self.dataSource[indexPath.row][@"headImage"]];
    cell.articleLabel.text=self.dataSource[indexPath.row][@"article"];
    cell.articleImage.image=[UIImage imageNamed:self.dataSource[indexPath.row][@"articleImage"]];
    return cell;
}

@end
