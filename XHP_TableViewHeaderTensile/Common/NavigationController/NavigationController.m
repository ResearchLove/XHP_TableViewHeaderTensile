//
//  NavigationController.m
//  XHP_TableViewHeaderTensile
//
//  Created by xiaohaiping on 16/8/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "NavigationController.h"

@implementation NavigationController

+(void)initialize
{

    UINavigationBar *navigationBar = [UINavigationBar appearance];
    NSMutableDictionary *textAttrsDict = [NSMutableDictionary dictionary];
    textAttrsDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    //textAttrsDict[NSFontAttributeName] = [UIFont systemFontOfSize:16.0f];
    [navigationBar setTitleTextAttributes:textAttrsDict];

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self.view insertSubview:self.alphaView belowSubview:self.navigationBar];
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsCompact];
    self.navigationBar.clipsToBounds = YES;


}

/**
 *  Getter and Setter
 *
 */
-(UIView *)alphaView
{
    if (_alphaView == nil) {
        _alphaView = [[UIView alloc]init];
        [_alphaView setFrame:CGRectMake(0, 0, self.navigationBar.bounds.size.width, self.navigationBar.bounds.size.height + 20)];
        _alphaView.backgroundColor = [UIColor clearColor];
    }
    return _alphaView;
}

/**
 *  隐藏导航栏
 *
 *  @param isHide 是否隐藏
 */
-(void)hideNavigationBar:(BOOL)isHide
{
    if (isHide) {
        [UIView animateWithDuration:1.0 animations:^{
            _alphaView.backgroundColor = [UIColor clearColor];
        }];
    }else{
        [UIView animateWithDuration:1.0 animations:^{
            _alphaView.backgroundColor = [UIColor orangeColor];
        }];
    }
}



@end
