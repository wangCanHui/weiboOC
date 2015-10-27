//
//  CZTabBar.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/26.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZTabBar.h"

@implementation CZTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        [self setupPlusButton]; 在这里设置不行
        // 设置tabBar背景图片
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_background_os7"]];
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    // 1. 添加中间按钮，代码只需执行一次即可
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self setupPlusButton];
    });
    
    // 2. 计算按钮的宽高
    NSUInteger count = 5;
    CGFloat btnW = self.bounds.size.width/count;
    CGFloat btnH = self.bounds.size.height;
    
    //    NSLog(@"%@",self.tabBar.subviews);
    
    // 3. 重新布局
    int index = 0;
    for (UIView *item in self.subviews) {
//        if (![item isKindOfClass:[UIImageView class]]) {  //子控件有一个UIImageView，需要排除它，下面判断方法更严谨
        if ([item isKindOfClass:NSClassFromString(@"UITabBarButton")] || [item isKindOfClass:NSClassFromString(@"UIButton")]) {
            item.frame = CGRectMake(index*btnW, 0, btnW, btnH);
//            NSLog(@"item=%@,frame=%@",item,NSStringFromCGRect(item.frame));
            index ++;
        }
        
        
//        NSLog(@"-------");
    }

}

- (void)setupPlusButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //  设置按钮图片
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // 设置按钮背景图片
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    [self insertSubview:btn atIndex:3];
}


@end
