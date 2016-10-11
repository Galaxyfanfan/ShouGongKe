//
//  JMHandNoLoginView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/11.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMHandNoLoginView.h"
@interface JMHandNoLoginView()
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *registerBtn;
@end
@implementation JMHandNoLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = kColorClear;
    self.userInteractionEnabled = YES;
    self.image = [UIImage imageNamed:@"pickGroupLogin@2x.jpg"];
    
    
    [self addSubview:self.registerBtn];
    [self addSubview:self.loginBtn];

    self.registerBtn.frame = CGRectMake(60, SCREEN_HEIGHT - 100, self.width - 120, kHeight40);
    self.loginBtn.frame = CGRectMake(60, self.registerBtn.top - kHeight40 - kSpace, self.registerBtn.width, kHeight40);
    
}





- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.backgroundColor = kColorWhite;
        _registerBtn.alpha = 0.9;
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:kColorDarkGray forState:UIControlStateNormal];
        _registerBtn.layer.cornerRadius = 5;
        _registerBtn.titleLabel.font = kFontSize16;
        kSelfWeak;
        [_registerBtn zzh_clickActionBlock:^(UIButton *button) {
            kSelfStrong;
            if (strongSelf.delegate && [self.delegate respondsToSelector:@selector(goToRegist)]) {
                [strongSelf.delegate goToRegist];
            }
        }];
        
    }
    return _registerBtn;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = kColorWhite;
        _loginBtn.alpha = 0.9;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:kColorDarkGray forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.titleLabel.font = kFontSize16;
        kSelfWeak;
        [_loginBtn zzh_clickActionBlock:^(UIButton *button) {
            kSelfStrong;
            if (strongSelf.delegate && [self.delegate respondsToSelector:@selector(goToLogin)]) {
                [strongSelf.delegate goToLogin];
            }
        }];
    }
    return _loginBtn;
}


@end
