//
//  CZMessageViewController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZMessageViewController.h"
#import "CZTwoViewController.h"

@interface CZMessageViewController ()

@end

@implementation CZMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"信息";
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithTitle:@"发起聊天" target:self action:@selector(friendsearchBtnClick)];
}

- (void)friendsearchBtnClick
{
    CZTwoViewController *twoVc = [[CZTwoViewController alloc]init];
    [self.navigationController pushViewController:twoVc animated:YES];
}

@end
