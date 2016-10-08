//
//  JMLoginView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/8.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#define kItemSpace 40

#import "JMLoginView.h"
@interface JMLoginView()
@property (nonatomic,strong)UITextField *userField;
@property (nonatomic,strong)UITextField *pwdField;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *forgetPwdBtn;
@end

@implementation JMLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = kColorClear;
    self.size = CGSizeMake(SCREEN_WIDTH, 320);
    

    [self addSubview:self.userField];
    [self addSubview:self.pwdField];
    [self addSubview:self.loginBtn];
    [self addSubview:self.forgetPwdBtn];
    
    self.userField.frame = CGRectMake(kItemSpace, 0, self.width - 2 * kItemSpace, kItemSpace);
    self.pwdField.frame = CGRectMake(kItemSpace, self.userField.bottom + kSpace, self.width - 2 * kItemSpace, kItemSpace);
    self.loginBtn.frame = CGRectMake(kItemSpace, self.pwdField.bottom + kSpace, self.width - 2 * kItemSpace, kItemSpace);
    self.forgetPwdBtn.frame = CGRectMake(kItemSpace, self.loginBtn.bottom + kSpace, 60, 20);
    
    
    //三方登录 和 注册
    UILabel *otherLab = [[UILabel alloc]initWithFrame:CGRectMake(0, self.loginBtn.bottom + kHeight40, SCREEN_WIDTH, 20)];
    otherLab.text = @"使用其他方式登录";
    otherLab.font = kFontSize13;
    otherLab.textColor = kColorWhite;
    otherLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:otherLab];
    
    CGFloat itemWidth = 45;
    CGFloat itemSpace = 50;
    CGFloat space = (SCREEN_WIDTH - 3 * itemWidth - 2 * itemSpace)/2;
    
    for (int i = 0; i < 3; i++) {
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        itemBtn.backgroundColor = kColorRed;
        itemBtn.frame = CGRectMake(i * (itemSpace + itemWidth) + space, otherLab.bottom + kSpace, itemWidth, itemWidth);
        itemBtn.tag = 100 + i;
        [self addSubview:itemBtn];
    }
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake((self.width - 70)/2, otherLab.bottom + itemWidth + 3 * kSpace, 70, 25);
    registerBtn.backgroundColor = RGB(255, 255, 255, 0.7);
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = registerBtn.height / 2;
    registerBtn.titleLabel.font = kFontSize13;
    [registerBtn setTitleColor:kColorBlack forState:UIControlStateNormal];
    [self addSubview:registerBtn];
}

#pragma mark - 懒加载

- (UITextField *)userField{
    if (!_userField) {
        _userField = [[UITextField alloc]init];
        _userField.placeholder = @"手机号/邮箱/用户名";
        _userField.backgroundColor = RGB(255, 255, 255, 0.7);
        _userField.layer.borderColor = kColorDarkGray.CGColor;
        _userField.layer.borderWidth = 0.5;
        _userField.layer.cornerRadius = 5;
        _userField.font = kFontSize13;
        _userField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
        _userField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _userField;
}

- (UITextField *)pwdField{
    if (!_pwdField) {
        _pwdField = [[UITextField alloc]init];
        _pwdField.placeholder = @"密码";
        _pwdField.backgroundColor = RGB(255, 255, 255, 0.7);
        _pwdField.layer.borderColor = kColorDarkGray.CGColor;
        _pwdField.layer.borderWidth = 0.5;
        _pwdField.layer.cornerRadius = 5;
        _pwdField.font = kFontSize13;
        _pwdField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 10)];
        _pwdField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _pwdField;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = kBaseRedColor;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.titleLabel.font = kFontSize18;
        
    }
    return _loginBtn;
}

- (UIButton *)forgetPwdBtn{
    if (!_forgetPwdBtn) {
        _forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        _forgetPwdBtn.layer.cornerRadius = 5;
        _forgetPwdBtn.titleLabel.font = kFontSize13;
        
    }
    return _forgetPwdBtn;
}







@end
