//
//  JMBaseBackView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMBaseBackView.h"
@interface JMBaseBackView()

@end
@implementation JMBaseBackView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = kColorWhite;
    
    [self addSubview:self.backBtn];
    
    self.backBtn.frame = CGRectMake(kSpace, kSpace, 20, 20);
    
}




- (void)goToBack{

}
- (void)backButtonWithTarget:(id)target action:(SEL)action{
    
    [self.backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - 懒加载
- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];        
    }
    return _backBtn;
}

@end
