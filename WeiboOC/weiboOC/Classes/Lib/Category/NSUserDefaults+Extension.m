//
//  NSUserDefaults+Extension.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "NSUserDefaults+Extension.h"

//沙盒的版本key
#define kVersionInSandBox @"VersionInSandBox"

@implementation NSUserDefaults (Extension)

+ (void)saveCurrentVersion
{
     //保存当前应用版本号到沙盒
    NSString *currentVersion = [self versionFromInfoPlist];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:currentVersion forKey:kVersionInSandBox];
    // 同步
    [defaults synchronize];
}

+ (NSString *)versionFromSandBox
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kVersionInSandBox];
}


+ (NSString *)versionFromInfoPlist
{
    NSDictionary *infoDict = [NSBundle mainBundle].infoDictionary;
//    NSLog(@"%@",infoDict);
    // 获取当前版本
    NSString *verisonKey = (__bridge NSString *)kCFBundleVersionKey;
//    NSLog(@"%@", infoDict[verisonKey]);
    
    NSString *currentVersion = infoDict[verisonKey];
    return currentVersion;
}

@end
