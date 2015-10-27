
//
//  CZPopController.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZPopController.h"

@interface CZPopController ()
@property (nonatomic,strong) UIButton *contentView;
@property (nonatomic,strong) UIImageView *popView;
@property (nonatomic,strong) UIButton *coverBtn;

@end

@implementation CZPopController

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(CZPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
 
    self.coverBtn.hidden = NO; //为了调用getter方法
//    self.popView.hidden = NO;
//    NSLog(@"popView:%@",self.popView);

    self.popView.frame = rect;
    NSString *imageName = nil;
    switch (arrowDirections) {
        case CZPopoverArrowDirectionBottomLeft:
            imageName = @"popover_background_left";
            break;
        case CZPopoverArrowDirectionBottomMid:
            imageName = @"popover_background";
            break;
        case CZPopoverArrowDirectionBottomRight:
            imageName = @"popover_background_right";
            break;
    }
    UIImage *image = [UIImage imageNamed:imageName];
    
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
    self.popView.image = image;
    
//    [view addSubview:self.popView];
    
    CGFloat leftMargin = 10;
    CGFloat rightMargin = 10;
    CGFloat topMargin = 15;
    CGFloat bottomMargin = 10;
    
    self.contentView.frame = CGRectMake(leftMargin,topMargin, self.popView.width - leftMargin - rightMargin , self.popView.height - topMargin - bottomMargin);

    
    [self.popView addSubview:self.contentView];

}


- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(CZPopoverArrowDirection)arrowDirections animated:(BOOL)animated
{
    
}

- (void)coverBtnClick
{
    
//    NSLog(@"%s",__func__);
    // 要从内存中移除
    [self.coverBtn removeFromSuperview];
    [self.popView removeFromSuperview];
}


#pragma mark - 懒加载

- (UIButton *)contentView
{
    if (!_contentView) {
        _contentView = [UIButton buttonWithType:UIButtonTypeCustom];
        _contentView.backgroundColor = [UIColor redColor];
        [_contentView addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contentView;
}

- (UIImageView *)popView
{
    if (!_popView) {
        _popView = [[UIImageView alloc]init];
        _popView.userInteractionEnabled = YES;
         [[UIApplication sharedApplication].keyWindow addSubview:_popView];
    }
    return _popView;
}

- (UIButton *)coverBtn
{
    if (!_coverBtn) {
        _coverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _coverBtn.backgroundColor = [UIColor blackColor];
        _coverBtn.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _coverBtn.alpha = 0.5;
        _coverBtn.hidden = NO;
      
        [[UIApplication sharedApplication].keyWindow addSubview:_coverBtn];
        
        [_coverBtn addTarget:self action:@selector(coverBtnClick) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"%@",[UIApplication sharedApplication].keyWindow.subviews);
    }
    return _coverBtn;
}

@end
