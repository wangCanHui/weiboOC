//
//  CZNavigationController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZNavigationController.h"

@interface CZNavigationController ()

@end

@implementation CZNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)load
{
     //设置导航条背景
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background_os7"] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航条标题
    
    //阴影了解
    NSShadow *showdow = [[NSShadow alloc] init];
    showdow.shadowOffset = CGSizeMake(0, 0);
    
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:23],NSShadowAttributeName:showdow}];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    NSUInteger count = self.viewControllers.count;
    
    NSString *title = nil;
    if (count == 2) {
        title = self.viewControllers[0].title;
    }else if(count > 2)
    {
        title = @"返回";
    }
    
    if (count >= 2) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithTitle:title target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem barBtnItemWithNormalImgName:@"navigationbar_more" selectedImgName:@"navigationbar_more_highlighted" target:self action:@selector(backHome)];
    }
    
    
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)backHome
{
    [self popToRootViewControllerAnimated:YES];
}

@end
