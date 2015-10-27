
//
//  CZDiscoverSearchBar.m
//  weiboOC
//
//  Created by 王灿辉 on 15/10/21.
//  Copyright © 2015年 王灿辉. All rights reserved.
//

#import "CZDiscoverSearchBar.h"


@interface CZDiscoverSearchBar () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldRightConstraint;

@property (nonatomic,strong) UIImageView *searchImageView;

@property (nonatomic,strong) UIButton *arrowBtn;

@end

@implementation CZDiscoverSearchBar

+ (instancetype)discoverSearchBar
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self.class) owner:nil options:0] lastObject];
}


- (void)awakeFromNib
{
    self.cancelBtn.hidden = YES;
    
    self.textField.delegate = self;
    //添加textField左边view
    self.textField.leftView = self.searchImageView;
    //设置左边view显示模式
#warning 一定要设置，否则不显示
    self.textField.leftViewMode = UITextFieldViewModeAlways;
}


- (IBAction)cancelBtnClick {
    self.cancelBtn.hidden = YES;
    // 恢复约束
    self.textFieldRightConstraint.constant = 8;
    // 恢复左边view
    self.textField.leftView = self.searchImageView;
    // 添加动画效果
#warning  约束动画不能把约束改变直接放在block
    [UIView animateWithDuration:0.25 animations:^{
        //要添加使用，调用父控件的layoutIfNeeded
        [self layoutIfNeeded];
    }];
    // 叫回键盘
    [self  endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    self.cancelBtn.hidden = NO;
    // 改变约束
    self.textFieldRightConstraint.constant = self.cancelBtn.bounds.size.width + 16;
    // 更新左边view
    self.textField.leftView = self.arrowBtn;
    
    return YES;
}

#pragma mark - 懒加载

- (UIImageView *)searchImageView
{
    if (!_searchImageView) {
        UIImage *image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        _searchImageView = [[UIImageView alloc]initWithImage:image];
        //设置图片不拉伸
        _searchImageView.contentMode = UIViewContentModeCenter;
        // 设置bounds
        CGSize size = image.size;
        _searchImageView.bounds = CGRectMake(0, 0, size.width + 16, size.height);
    }
    return _searchImageView;
}

- (UIButton *)arrowBtn
{
    if (!_arrowBtn) {
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_arrowBtn setImage:[UIImage imageNamed:@"popover_arrow"] forState:UIControlStateNormal];
        _arrowBtn.bounds = self.searchImageView.bounds;
         //图片控制转180度
        _arrowBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    return _arrowBtn;
}

@end
