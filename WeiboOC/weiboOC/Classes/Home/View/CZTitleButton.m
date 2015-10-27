//
//  CZTitleButton.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/26.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZTitleButton.h"

@implementation CZTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame ]) {
        [self setupSelf];
    }
    return self;
}

- (void)setupSelf
{
    // 设置背景图片
    [self setBackgroundImage:[UIImage imageNamed:@"timeline_card_bottom_line_highlighted"] forState:UIControlStateNormal];
    //设置图片
    [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateHighlighted];
    //设置文字颜色
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     //重新设置按钮w,h
    UIImage *image = self.imageView.image;
    CGSize imgSize = image.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    CGFloat selfW = imgSize.width + titleSize.width + 5;
    CGFloat selfH = imgSize.height;
    
    // 重新设置图片frame
    CGFloat imgW = selfW - imgSize.width;
    CGFloat imgY = selfH - imgSize.height * 0.5;
    self.imageView.frame = CGRectMake(imgW, imgY, imgSize.width, imgSize.height);
    
    // 设置title的frame
//    CGFloat titleY = selfH - titleSize.height * 0.5;
    self.titleLabel.frame = CGRectMake(0, 0, titleSize.width, titleSize.height);
}

@end
