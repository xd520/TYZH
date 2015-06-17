//
//  XHExampleSideDrawerViewController.m
//  XHDrawerController
//
//  Created by 曾 宪华 on 13-12-27.
//  Copyright (c) 2013年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHExampleSideDrawerViewController.h"
#import "XHExampleCenterSideDrawerViewController.h"
#import "TYZHmainViewController.h"
#import "TYZHmyInveViewController.h"
#import "TYZHAccountViewController.h"
#import "TYZHmoreViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "InverstViewController.h"
#import "AccountViewController.h"

@interface XHExampleSideDrawerViewController ()

@end

@implementation XHExampleSideDrawerViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)left {
    [self.drawerController toggleDrawerSide:XHDrawerSideLeft animated:YES completion:NULL];
}

- (void)right {
    [self.drawerController toggleDrawerSide:XHDrawerSideRight animated:YES completion:^(BOOL finished) {
        
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Left", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(left)];
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Right", @"") style:UIBarButtonItemStyleBordered target:self action:@selector(right)];
    
    
}

- (id)init {
    self = [super init];
    if (self) {
        [self setDataSource:@[@"统一账户", @"贵州金融资产", @"青创版"]];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDatasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self dataSource] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setBackgroundColor:[UIColor clearColor]];
    [[cell textLabel] setTextColor:[UIColor whiteColor]];
    [[cell textLabel] setText:[self dataSource][[indexPath row]]];
    [cell setSelectedBackgroundView:[UIView new]];
    [[cell textLabel] setHighlightedTextColor:[UIColor purpleColor]];
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        
        
        TYZHmainViewController *centerViewController = [[TYZHmainViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.image = [UIImage imageNamed:@"Hypno"];
        navigationController.tabBarItem = item1;
        
        TYZHmyInveViewController *view1 = [[TYZHmyInveViewController alloc] init];
         UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:view1];
        nav1.navigationBar.backgroundColor = [UIColor blackColor];
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.image = [UIImage imageNamed:@"Hypno"];
        nav1.tabBarItem = item2;
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab.font = [UIFont boldSystemFontOfSize:20];
        lab.textColor = [UIColor blackColor];
        lab.backgroundColor = [UIColor clearColor];
        lab.text = @"我的投资";
        lab.textAlignment = NSTextAlignmentCenter;
        [nav1.navigationBar addSubview:lab];
        
       
        
        
        TYZHAccountViewController *view2 = [[TYZHAccountViewController alloc] init];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:view2];
        UITabBarItem *item3 = [[UITabBarItem alloc] init];
        item3.image = [UIImage imageNamed:@"Hypno"];
        nav2.tabBarItem = item3;
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab1.font = [UIFont boldSystemFontOfSize:20];
        lab1.textColor = [UIColor blackColor];
        lab1.backgroundColor = [UIColor clearColor];
        lab1.text = @"我的账户";
        lab1.textAlignment = NSTextAlignmentCenter;
        [nav2.navigationBar addSubview:lab1];
        
        TYZHmoreViewController *view3 = [[TYZHmoreViewController alloc] init];
         UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:view3];
        UITabBarItem *item4 = [[UITabBarItem alloc] init];
        item4.image = [UIImage imageNamed:@"Hypno"];
        nav3.tabBarItem = item4;
        UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab2.font = [UIFont boldSystemFontOfSize:20];
        lab2.textColor = [UIColor blackColor];
        lab2.backgroundColor = [UIColor clearColor];
        lab2.text = @"我的更多";
        lab2.textAlignment = NSTextAlignmentCenter;
        [nav3.navigationBar addSubview:lab2];
        
        
        navigationController.tabBarItem.title = @"首页";
        nav1.tabBarItem.title = @"投资列表";
        nav2.tabBarItem.title = @"账户";
        nav3.tabBarItem.title = @"更多";
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        [tab setViewControllers:[[NSArray alloc] initWithObjects:navigationController,nav1,nav2,nav3, nil]];
        
        [tab.tabBar setSelectedImageTintColor:[UIColor redColor]];
        
        [[centerViewController navigationItem] setTitle:[self dataSource][[indexPath row]]];
        
        self.drawerController.centerViewController = tab;
        [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            
        }];
        
        
        
    } else if(indexPath.row == 1) {
        
        
        FirstViewController *centerViewController = [[FirstViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.image = [UIImage imageNamed:@"Hypno"];
        navigationController.tabBarItem = item1;
        
        SecondViewController *view1 = [[SecondViewController alloc] init];
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:view1];
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.image = [UIImage imageNamed:@"Hypno"];
        nav1.tabBarItem = item2;
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab.font = [UIFont boldSystemFontOfSize:20];
        lab.textColor = [UIColor blackColor];
        lab.backgroundColor = [UIColor clearColor];
        lab.text = @"我的投资";
        lab.textAlignment = NSTextAlignmentCenter;
        [nav1.navigationBar addSubview:lab];
        
        
        ThirdViewController *view2 = [[ThirdViewController alloc] init];
        UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:view2];
        UITabBarItem *item3 = [[UITabBarItem alloc] init];
        item3.image = [UIImage imageNamed:@"Hypno"];
        nav2.tabBarItem = item3;
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab1.font = [UIFont boldSystemFontOfSize:20];
        lab1.textColor = [UIColor blackColor];
        lab1.backgroundColor = [UIColor clearColor];
        lab1.text = @"我的投资";
        lab1.textAlignment = NSTextAlignmentCenter;
        [nav2.navigationBar addSubview:lab1];
        
        
        
        
        navigationController.tabBarItem.title = @"首页";
        nav1.tabBarItem.title = @"投资列表";
        nav2.tabBarItem.title = @"账户";
       
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        [tab setViewControllers:[[NSArray alloc] initWithObjects:navigationController,nav1,nav2, nil]];
        
        [tab.tabBar setSelectedImageTintColor:[UIColor redColor]];
        
        [[centerViewController navigationItem] setTitle:[self dataSource][[indexPath row]]];
        
        self.drawerController.centerViewController = tab;
        [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            
        }];
        
    
    
    } else {
        
        
        InverstViewController *centerViewController = [[InverstViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
        UITabBarItem *item1 = [[UITabBarItem alloc] init];
        item1.image = [UIImage imageNamed:@"Hypno"];
        navigationController.tabBarItem = item1;
        
        AccountViewController *view1 = [[AccountViewController alloc] init];
        UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:view1];
        UITabBarItem *item2 = [[UITabBarItem alloc] init];
        item2.image = [UIImage imageNamed:@"Hypno"];
        nav1.tabBarItem = item2;
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 220, 30)];
        lab.font = [UIFont boldSystemFontOfSize:20];
       lab.textColor = [UIColor blackColor];
        lab.backgroundColor = [UIColor clearColor];
        lab.text = @"我的投资";
        lab.textAlignment = NSTextAlignmentCenter;
        [nav1.navigationBar addSubview:lab];
        
    
        
        
        navigationController.tabBarItem.title = @"首页";
        nav1.tabBarItem.title = @"投资列表";
        
        
        UITabBarController *tab = [[UITabBarController alloc] init];
        [tab setViewControllers:[[NSArray alloc] initWithObjects:navigationController,nav1, nil]];
        
        [tab.tabBar setSelectedImageTintColor:[UIColor redColor]];
        
        [[centerViewController navigationItem] setTitle:[self dataSource][[indexPath row]]];
        
        self.drawerController.centerViewController = tab;
        [self.drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
            
        }];
    
    
    }
}



@end
