//
//  CZNewFeatureController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZNewFeatureController.h"
#import "CZBeginView.h"

@interface CZNewFeatureController ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIPageControl *pageC;
@end

@implementation CZNewFeatureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 0. 图片个数
    CGFloat count = 4;
    
    // 1. 创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    // 2. 设置UIScrollView的属性
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(kScreenWidth * count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    
    // 3. 创建4个imageView
    for (int index = 0; index < count; index ++) {
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",index+1];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        
        imageView.frame = CGRectMake(index * kScreenWidth, 0, kScreenWidth, kScreenHeight);
        
        [scrollView addSubview:imageView];
        
        // 显示体验按钮
        if (index == 3) {
            imageView.userInteractionEnabled = YES;
            CZBeginView *beginView = [CZBeginView beginView];
            beginView.centerX = self.view.centerX;
            beginView.centerY = kScreenHeight - beginView.width * 0.5 - 65;
            [imageView addSubview:beginView];
        }
    }
    
    // 4. 创建分页指示器
    UIPageControl *pageC = [[UIPageControl alloc]init];
    [self.view addSubview:pageC];
    // 5. 设置分页指示器属性
    pageC.centerX = self.view.center.x;
    pageC.centerY = kScreenHeight - 70;
    
    pageC.numberOfPages = count;
    pageC.pageIndicatorTintColor = [UIColor grayColor];
    pageC.currentPageIndicatorTintColor = [UIColor orangeColor];
    self.pageC = pageC;
}

#pragma mark - UIScrollViewDelegate方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.pageC.currentPage = (offsetX + kScreenWidth*0.5)/kScreenWidth;
}


@end
