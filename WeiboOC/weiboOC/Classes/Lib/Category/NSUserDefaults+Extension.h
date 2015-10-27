//
//  NSUserDefaults+Extension.h
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Extension)

/**
 *  保存当前版本号到偏好设置
 */
+(void)saveCurrentVersion;


/**
 *  获取沙盒的版本号
 */
+(NSString *)versionFromSandBox;

/**
 *  获取Info.plist的版本号
 */
+(NSString *)versionFromInfoPlist;

@end
