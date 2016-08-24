//
//  NavigationController.h
//  XHP_TableViewHeaderTensile
//
//  Created by xiaohaiping on 16/8/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationController : UINavigationController

@property (strong,nonatomic) UIView *alphaView;

-(void)hideNavigationBar:(BOOL)isHide;

@end
