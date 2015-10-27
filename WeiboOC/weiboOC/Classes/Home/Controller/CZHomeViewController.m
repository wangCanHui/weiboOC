//
//  CZHomeViewController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZHomeViewController.h"
#import "CZTwoViewController.h"
#import "CZTitleButton.h"

@interface CZHomeViewController ()

@end

@implementation CZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
    NSLog(@"%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));

    
//    self.title = @"首页";
     //设置导航条左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImgName:@"navigationbar_friendsearch" selectedImgName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearchBtnClick)];
    
     //设置导航条右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImgName:@"navigationbar_pop" selectedImgName:@"navigationbar_pop_highlighted" target:nil action:nil];
    
     // 添加按钮到导航栏中间
    CZTitleButton *title = [[CZTitleButton alloc]init];
    title.bounds = CGRectMake(0, 0, 100, 30);
    [title setTitle:@"wangCanHui" forState:UIControlStateNormal];
    self.navigationItem.titleView = title;
    
}

- (void)friendsearchBtnClick
{
    CZTwoViewController *twoVc = [[CZTwoViewController alloc]init];
    [self.navigationController pushViewController:twoVc animated:YES];
}

@end
