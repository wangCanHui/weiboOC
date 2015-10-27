//
//  CZBeginView.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZBeginView.h"
#import "CZTabBarController.h"

@implementation CZBeginView

+ (instancetype)beginView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self.class) owner:nil options:0] lastObject];
}


- (IBAction)share:(id)sender {
    
    
}

- (IBAction)begin:(id)sender {
    CZTabBarController *tabBarC = [[CZTabBarController alloc]init];
    self.window.rootViewController = tabBarC;
    
}
@end
