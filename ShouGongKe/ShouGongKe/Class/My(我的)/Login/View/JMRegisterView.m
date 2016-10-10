//
//  JMRegisterView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/10.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#define kItemSpace 40

#import "JMRegisterView.h"
@interface JMRegisterView()<UITextFieldDelegate>
@property (nonatomic,strong)UITextField *userField;
@property (nonatomic,strong)UITextField *codeField;
@property (nonatomic,strong)UIButton *codeBtn;
@property (nonatomic,strong)UITextField *pwdField;
@property (nonatomic,strong)UIButton *registerBtn;
@property (nonatomic,strong)UIButton *loginBtn;
@end
@implementation JMRegisterView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = kColorClear;
    self.size = CGSizeMake(SCREEN_WIDTH - 2 * kItemSpace, 220);
    
    
    [self addSubview:self.userField];
    [self addSubview:self.codeField];
    [self.codeField addSubview:self.codeBtn];
    [self addSubview:self.pwdField];
    [self addSubview:self.registerBtn];
    [self addSubview:self.loginBtn];
    
    self.userField.frame = CGRectMake(0, 0, self.width, kItemSpace);
    self.codeField.frame = CGRectMake(0, self.userField.bottom + kSpace, self.width , kItemSpace);
    self.codeBtn.frame = CGRectMake(self.codeField.width - 70, 0, 70, self.codeField.height);
    self.pwdField.frame = CGRectMake(0, self.codeField.bottom + kSpace, self.width , kItemSpace);
    self.registerBtn.frame = CGRectMake(0, self.pwdField.bottom + kSpace, self.width, kItemSpace);
    self.loginBtn.frame = CGRectMake(0, self.registerBtn.bottom + kSpace, 120, 20);
    
}
#pragma mark - action
- (void)clickRegistAction{

    
}

#pragma mark - 懒加载

- (UITextField *)userField{
    if (!_userField) {
        _userField = [[UITextField alloc]init];
        _userField.placeholder = @"手机号";
        _userField.backgroundColor = RGB(255, 255, 255, 0.7);
        _userField.layer.borderColor = kColorDarkGray.CGColor;
        _userField.layer.borderWidth = 0.5;
        _userField.layer.cornerRadius = 5;
        _userField.font = kFontSize13;
        _userField.keyboardType = UIKeyboardTypeNumberPad;
        _userField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
        _userField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _userField;
}

- (UITextField *)codeField{
    if (!_codeField) {
        _codeField = [[UITextField alloc]init];
        _codeField.placeholder = @"验证码";
        _codeField.backgroundColor = RGB(255, 255, 255, 0.7);
        _codeField.layer.borderColor = kColorDarkGray.CGColor;
        _codeField.layer.borderWidth = 0.5;
        _codeField.layer.cornerRadius = 5;
        _codeField.font = kFontSize13;
        _codeField.keyboardType = UIKeyboardTypeNumberPad;
        _codeField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
        _codeField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _codeField;
}

- (UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = kFontSize12;
        [_codeBtn setTitleColor:kBaseRedColor forState:UIControlStateNormal];
    }
    return _codeBtn;
}

- (UITextField *)pwdField{
    if (!_pwdField) {
        _pwdField = [[UITextField alloc]init];
        _pwdField.placeholder = @"密码 请输入6-16位数字或字母";
        _pwdField.backgroundColor = RGB(255, 255, 255, 0.7);
        _pwdField.layer.borderColor = kColorDarkGray.CGColor;
        _pwdField.layer.borderWidth = 0.5;
        _pwdField.layer.cornerRadius = 5;
        _pwdField.font = kFontSize13;
        _pwdField.secureTextEntry = YES;
        _pwdField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
        _pwdField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _pwdField;
}

- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerBtn.backgroundColor = kBaseRedColor;
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registerBtn.layer.cornerRadius = 5;
        _registerBtn.titleLabel.font = kFontSize18;
        kSelfWeak;
        [_registerBtn zzh_clickActionBlock:^(UIButton *button) {
            kSelfStrong;
            [strongSelf clickRegistAction];
        }];
        
    }
    return _registerBtn;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObject:kBaseRedColor forKey:NSForegroundColorAttributeName];
//        NSAttributedString *attStr = [[NSAttributedString alloc]initWithString:@"已有账号，去登录" attributes:attributesDictionary];
//        _loginBtn.titleLabel.attributedText = attStr;
        [_loginBtn setTitle:@"已有账号，去登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = kFontSize13;
        kSelfWeak;
        [_loginBtn zzh_clickActionBlock:^(UIButton *button) {
            kSelfStrong;
            if (strongSelf.delegate && [self.delegate respondsToSelector:@selector(goBack)]) {
                [strongSelf.delegate goBack];
            }
        }];
    }
    return _loginBtn;
}









@end
