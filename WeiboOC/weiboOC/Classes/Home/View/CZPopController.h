//
//  CZPopController.h
//  weiboOC
//
//  Created by 王灿辉 on 15/10/27.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, CZPopoverArrowDirection) {
    CZPopoverArrowDirectionBottomLeft = 1UL << 0,
    CZPopoverArrowDirectionBottomMid = 1UL << 1,
    CZPopoverArrowDirectionBottomRight = 1UL << 2,
};

@interface CZPopController : NSObject

- (void)presentPopoverFromRect:(CGRect)rect inView:(UIView *)view permittedArrowDirections:(CZPopoverArrowDirection)arrowDirections animated:(BOOL)animated;


- (void)presentPopoverFromBarButtonItem:(UIBarButtonItem *)item permittedArrowDirections:(CZPopoverArrowDirection)arrowDirections animated:(BOOL)animated;

@end
