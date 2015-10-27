//
//  CZTwoViewController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/18.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZTwoViewController.h"
#import "CZThreeViewController.h"

@interface CZTwoViewController ()

@end

@implementation CZTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"two";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CZThreeViewController *threeVc = [[CZThreeViewController alloc]init];
    [self.navigationController pushViewController:threeVc animated:YES];
}
@end
