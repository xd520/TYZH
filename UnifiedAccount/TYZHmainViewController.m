//
//  TYZHmainViewController.m
//  UnifiedAccount
//
//  Created by mac on 15/6/17.
//  Copyright (c) 2015年 ApexSoft. All rights reserved.
//

#import "TYZHmainViewController.h"
#import "PublicMethod.h"

@interface TYZHmainViewController ()

@end

@implementation TYZHmainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[PublicMethod getIPAddress]);
     NSLog(@"%@",[PublicMethod GetMacAddress]);
     NSLog(@"%@",[PublicMethod GetImageIdentify]);
     NSLog(@"%@",[PublicMethod getDeviceMessage]);
    
     NSLog(@"%@",[PublicMethod getDeviceType]);
    
     NSLog(@"%@",[PublicMethod getUserContacts]);
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
