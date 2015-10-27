//
//  AppDelegate.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "AppDelegate.h"
#import "CZTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[CZTabBarController alloc]init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
