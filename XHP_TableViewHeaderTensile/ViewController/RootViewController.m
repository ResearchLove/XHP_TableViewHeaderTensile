//
//  RootViewController.m
//  XHP_TableViewHeaderTensile
//
//  Created by xiaohaiping on 16/8/23.
//  Copyright © 2016年 HaoHeHealth. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"我的"];
    [self.view addSubview:self.tableView];
    
    // Do any additional setup after loading the view.
}

/**
 *  UITableViewDataSource
 *
 */
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}


/**
 *  Getter and Setter
 *
 */
-(UITableView *)tableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc]init];
        [_tableView setFrame:self.view.bounds];
        //设置宽高可拉伸
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView.tableHeaderView = self.headerView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(UIView *)headerView
{
    if (_headerView == nil) {
        _headerView = [[UIView alloc]init];
        [_headerView setFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        [_headerView addSubview:self.imageView];
    }
    return _headerView;
}

-(UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.image = [UIImage imageNamed:@"header"];
        [_imageView setFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
    }
    return _imageView;
}

/**
 *  当scrollView的contentOffset改变时调用
 *
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取偏移量
    CGPoint offset = scrollView.contentOffset;
    if (offset.y <= 0) {
        [(NavigationController *) self.navigationController hideNavigationBar:YES];
        CGRect rect = self.headerView.frame;
        rect.origin.y = offset.y;
        rect.size.height = CGRectGetHeight(rect) - offset.y;
        _imageView.frame = rect;
    }else{
        [(NavigationController *) self.navigationController hideNavigationBar:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
