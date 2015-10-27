//
//  UIBarButtonItem+Extension.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)barBtnItemWithNormalImgName:(NSString *)normalName selectedImgName:(NSString *)selName target:(id)target action:(SEL)action
{
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *normalImage = [UIImage imageNamed:normalName];
    
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:selName] forState:UIControlStateHighlighted];
    
    [item addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    CGSize size = normalImage.size;
    
    item.bounds = CGRectMake(0, 0, size.width, size.height);
    
    return [[UIBarButtonItem alloc]initWithCustomView:item];
}

+ (instancetype)backItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *normalImage = [UIImage imageNamed:@"navigationbar_back_withtext"];
    CGSize imageSize = normalImage.size;
    // 设置按钮图片
    [backBtn setImage:normalImage forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_withtext_highlighted"] forState:UIControlStateHighlighted];
    
    // 设置按钮字体
    [backBtn setTitle:title forState:UIControlStateNormal];
    // 设置按钮字体的大小和不同状态下的颜色
    UIFont *titleFont = [UIFont systemFontOfSize:16];
    backBtn.titleLabel.font = titleFont;
    [backBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
    //计算文字所要的尺寸
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    
    // 设置按钮的尺寸
    CGFloat btnW = imageSize.width + titleSize.width;
    CGFloat btnH = imageSize.height;
    backBtn.bounds = CGRectMake(0, 0, btnW, btnH);
    
    // 给按钮添加监听事件
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:backBtn];
}

+ (instancetype)barBtnItemWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    // 设置按钮字体
    [btn setTitle:title forState:UIControlStateNormal];
    // 设置按钮字体的大小和不同状态下的颜色
    UIFont *titleFont = [UIFont systemFontOfSize:16];
    btn.titleLabel.font = titleFont;
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    
    //计算文字所要的尺寸
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:titleFont} context:nil].size;
    
    // 设置按钮的尺寸
    CGFloat btnW = titleSize.width;
    CGFloat btnH = titleSize.height;
    btn.bounds = CGRectMake(0, 0, btnW, btnH);
    
    // 给按钮添加监听事件
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

@end
