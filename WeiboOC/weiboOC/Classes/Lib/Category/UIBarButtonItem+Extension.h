//
//  UIBarButtonItem+Extension.h
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

/**
 *  快速创建UIBarButtonItem的方法
 *
 *  @param normalName 普通状态下的图片
 *  @param selName    选中状态下的图片
 *  @param target     按钮的target
 *  @param action     按钮的点击事件
 *
 *  @return UIBarButtonItem对象
 */
+ (instancetype)barBtnItemWithNormalImgName:(NSString *)normalName selectedImgName:(NSString *)selName target:(id)target action:(SEL)action;

/**
 *  快速创建返回按钮的方法
 *
 *  @param title  按钮文字
 *  @param target 按钮的target
 *  @param action 触发的事件
 *
 *  @return UIBarButtonItem对象
 */
+ (instancetype)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
/**
 *  返回固定样式导航条Item
 */
+(instancetype)barBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
