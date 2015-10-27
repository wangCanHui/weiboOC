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
#import "CZPopController.h"

@interface CZHomeViewController ()

@property (nonatomic,strong) CZPopController *popVc;

@end

@implementation CZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@",NSStringFromCGRect(self.navigationController.navigationBar.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));

    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.title = @"首页";
     //设置导航条左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImgName:@"navigationbar_friendsearch" selectedImgName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearchBtnClick)];
    
     //设置导航条右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImgName:@"navigationbar_pop" selectedImgName:@"navigationbar_pop_highlighted" target:nil action:nil];
    
     // 添加按钮到导航栏中间
    CZTitleButton *title = [[CZTitleButton alloc]init];
    [title addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    title.bounds = CGRectMake(0, 0, 100, 30);
    [title setTitle:@"wangCanHui" forState:UIControlStateNormal];
    self.navigationItem.titleView = title;
    
}


- (void)titleBtnClick:(CZTitleButton *)btn
{
    CZPopController *popVc = [[CZPopController alloc]init];
    
    CGFloat y = 20 + btn.frame.origin.y + btn.bounds.size.height;
//    NSLog(@"%f",self.tabBarController.tabBar.height);
    CGFloat width = 150;
    CGFloat height = 200;
    CGFloat x = (kScreenWidth - width)*0.5;
    CGRect frame = CGRectMake(x, y, width, height);
    
    [popVc presentPopoverFromRect:frame inView:self.view permittedArrowDirections:CZPopoverArrowDirectionBottomLeft animated:YES];
    
//  这里需要对popVc控制器有一个强引用，否则当这个方法执行完毕 popVc就销毁了，控制器都变成nil,控制内部的代码自然也无法执行
    self.popVc = popVc;
}



- (void)friendsearchBtnClick
{
    CZTwoViewController *twoVc = [[CZTwoViewController alloc]init];
    [self.navigationController pushViewController:twoVc animated:YES];
}

@end
