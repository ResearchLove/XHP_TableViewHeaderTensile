//
//  RootViewController.h
//  XHP_TableViewHeaderTensile
//
//  Created by xiaohaiping on 16/8/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationController.h"

@interface RootViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) NavigationController *naviCon;
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIImageView *imageView;

@end
