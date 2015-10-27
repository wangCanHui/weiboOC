//
//  AppDelegate.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "AppDelegate.h"
#import "CZTabBarController.h"
#import "CZNewFeatureController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. 创建window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2. 实例化两个控制器
    CZTabBarController *tabBarC = [[CZTabBarController alloc]init];
    CZNewFeatureController *newFeatureC = [[CZNewFeatureController alloc]init];
    
    // 3. 根据沙河版本号和info.plist的版本号对比，判断是否需要展示新特性
    NSString *sandBoxVersion = [NSUserDefaults versionFromSandBox];
    NSString *currentVerison = [NSUserDefaults versionFromInfoPlist];
    
    if (!sandBoxVersion || currentVerison.doubleValue > sandBoxVersion.doubleValue) { //说明是第一次使用或已经更新版本，展示新特性
        self.window.rootViewController = newFeatureC;
        // 保存新版本号到沙河中
        [NSUserDefaults saveCurrentVersion];
    }else // 版本未更新，不需要展示新特性，直接显示首页
    {
        self.window.rootViewController = tabBarC;
    }
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
