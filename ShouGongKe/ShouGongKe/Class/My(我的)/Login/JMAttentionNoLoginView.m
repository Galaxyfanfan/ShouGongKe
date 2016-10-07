//
//  JMAttentionNoLoginView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMAttentionNoLoginView.h"
@interface JMAttentionNoLoginView()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *textLab;
@property(nonatomic,strong)UIButton *loginBtn;
@end

@implementation JMAttentionNoLoginView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
//    [self addSubview:self.imgView];
    [self addSubview:self.textLab];
    [self addSubview:self.loginBtn];
    
    
//    self.imgView.size = CGSizeMake(200, 100);
//    self.imgView.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2 - 200);

    self.textLab.frame = CGRectMake(kSpace, SCREEN_HEIGHT/2 - 100, SCREEN_WIDTH - 2 * kSpace, 20);
    self.loginBtn.frame = CGRectMake(40, self.textLab.bottom + 30, SCREEN_WIDTH - 80, 40);
}



#pragma mark - 懒加载
- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = kBaseRedColor;
    }
    return _imgView;
}

- (UILabel *)textLab{
    if (!_textLab) {
        _textLab = [[UILabel alloc]init];
        _textLab.font = kFontSize13;
        _textLab.textColor = kColorLightGray;
//        _textLab.backgroundColor = [UIColor yellowColor];
        _textLab.textAlignment = NSTextAlignmentCenter;
        _textLab.text = @"请先登录，才能查看关注的好友动态";
    }
    return _textLab;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.backgroundColor = kBaseRedColor;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = kFontSize15;
        _loginBtn.layer.cornerRadius = 5;
        kSelfWeak;
        [_loginBtn zzh_clickActionBlock:^(UIButton *button) {
            kSelfStrong;
            if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(JMAttentionNoLoginViewGotoLogin)]) {
                [strongSelf.delegate JMAttentionNoLoginViewGotoLogin];
            }
        }];
    }
    return _loginBtn;
}



@end
