//
//  CZTabBarController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZHomeViewController.h"
#import "CZMessageViewController.h"
#import "CZDiscoverViewController.h"
#import "CZMeViewController.h"
#import "CZNavigationController.h"
#import "CZTabBar.h"

@interface CZTabBarController ()

@end

@implementation CZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor redColor];
   
    // 1.添加首页
    CZHomeViewController *homeVc = [[CZHomeViewController alloc]init];
    [self addChildVcWith:homeVc title:@"首页" normalImgName:@"tabbar_home" selectedImgName:@"tabbar_home_selected"];
    
    // 2.添加信息
    CZMessageViewController *messageVc = [[CZMessageViewController alloc]init];
    [self addChildVcWith:messageVc title:@"信息" normalImgName:@"tabbar_message_center" selectedImgName:@"tabbar_message_center_selected"];
    
    // 3.添加发现
    CZDiscoverViewController *discoverVc = [[CZDiscoverViewController alloc]init];
    [self addChildVcWith:discoverVc title:@"发现" normalImgName:@"tabbar_discover" selectedImgName:@"tabbar_discover_selected"];
    
    // 4.添加我
    CZMeViewController *meVc = [[CZMeViewController alloc]init];
    [self addChildVcWith:meVc title:@"我" normalImgName:@"tabbar_profile" selectedImgName:@"tabbar_profile_selected"];
    
    // 5.设置自定义tabbar
    CZTabBar *tabBar = [[CZTabBar alloc]init];
    // 5.1替换系统tabbar
    #warning 如果类有个readonly属性，使用kvc方式可替换系统的tabbar
    [self setValue:tabBar forKey:@"tabBar"];
   
}

- (void)addChildVcWith:(UIViewController *)vc title:(NSString *)title normalImgName:(NSString *)nolName selectedImgName:(NSString *)selName
{
    CZNavigationController *nav = [[CZNavigationController alloc]initWithRootViewController:vc];
    
    //设置标题
    nav.tabBarItem.title = title;
    //设置标题被选中状态的颜色
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor orangeColor]} forState:UIControlStateSelected];
    //设置普通状态下图片
    nav.tabBarItem.image= [UIImage imageNamed:nolName];
    
    //设置选中状态下的图片
    UIImage *selectedImage = [UIImage imageNamed:selName];
    // 去掉系统的渲染，默认情况下，tabbar会选中的图片进行渲染成蓝色
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = selectedImage;
    
    [self addChildViewController:nav];
}

#warning 在此方法中重新布局tabBarItem是没用的，在viewDidAppear打印出来的frame值又变了回去，原因暂时不明，在viewDidAppear重新布局也没有用，最后解决办法只能自定义tabBar，来替换当前控制器的tabBar
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    
//    // 1. 添加中间按钮，代码只需执行一次即可
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        UIButton *btn = [self addButton];
//        [self.tabBar insertSubview:btn atIndex:2];
//        
//    });
//    
//    // 2. 计算按钮的宽高
//    NSUInteger count = 5;
//    CGFloat btnW = self.tabBar.bounds.size.width/count;
//    CGFloat btnH = self.tabBar.bounds.size.height;
//    
//    //    NSLog(@"%@",self.tabBar.subviews);
//    
//    // 3. 重新布局
//    int index = 0;
//    for (UIView *item in self.tabBar.subviews) {
//        if (![item isKindOfClass:[UIImageView class]]) {  //子控件有一个UIImageView，需要排除它
//            item.frame = CGRectMake(index*btnW, 0, btnW, btnH);
//            NSLog(@"item=%@,frame=%@",item,NSStringFromCGRect(item.frame));
//            index ++;
//        }
//        
//        
//        NSLog(@"-------");
//    }
//}

@end
