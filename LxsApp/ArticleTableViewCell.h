//
//  ArticleTableViewCell.h
//  LxsApp
//
//  Created by cxupx19 on 15/10/17.
//  Copyright © 2015年 Linxs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *headImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *articleImage;

@property (strong, nonatomic) IBOutlet UILabel *articleLabel;

@end
