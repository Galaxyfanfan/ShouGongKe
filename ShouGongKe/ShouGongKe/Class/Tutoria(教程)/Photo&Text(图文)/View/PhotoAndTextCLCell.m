//
//  PhotoAndTextCLCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/11/16.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "PhotoAndTextCLCell.h"
@interface PhotoAndTextCLCell()
@property (nonatomic,strong)UIImageView *photoView;
@property (nonatomic,strong)UIView *bottomView;
@property (nonatomic,strong)YYLabel *titleLab;
@property (nonatomic,strong)YYLabel *nameLab;
@property (nonatomic,strong)UIView *line;
@property (nonatomic,strong)YYLabel *contentLab;
@end
@implementation PhotoAndTextCLCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    [self addSubview:self.photoView];
    [self addSubview:self.bottomView];
    [self.bottomView addSubview:self.titleLab];
    [self.bottomView addSubview:self.nameLab];
    [self.bottomView addSubview:self.line];
    [self.bottomView addSubview:self.contentLab];
    
    self.photoView.frame = self.bounds;
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@70);
        make.width.equalTo(self.photoView.mas_width);
        make.bottom.equalTo(self.photoView.mas_bottom).offset(0);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(self.bottomView.mas_left).offset(5);
        make.right.equalTo(self.bottomView.mas_right).offset(-5);
        make.top.equalTo(@5);
    }];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(self.bottomView.mas_left).offset(5);
        make.right.equalTo(self.bottomView.mas_right).offset(-5);
        make.top.equalTo(self.titleLab.mas_bottom).offset(5);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(self.bottomView.mas_left).offset(5);
        make.right.equalTo(self.bottomView.mas_right).offset(-5);
        make.top.equalTo(self.nameLab.mas_bottom).offset(5);
    }];
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@15);
        make.left.equalTo(self.bottomView.mas_left).offset(5);
        make.right.equalTo(self.bottomView.mas_right).offset(-5);
        make.top.equalTo(self.line.mas_bottom).offset(5);
    }];
    
    self.titleLab.text = @"sdfeefwefw";
    self.nameLab.text = @"sdfeefwefw";
    self.contentLab.text = @"sdfeefwefw";
}


#pragma mark - 懒加载
- (UIImageView *)photoView{
    if (!_photoView) {
        _photoView =[[UIImageView alloc]initWithFrame:self.bounds];
        _photoView.backgroundColor = kBackgroundColor;
    }
    return _photoView;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = kColorRandom;
    }
    return _bottomView;
}

- (YYLabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[YYLabel alloc]init];
        _titleLab.textColor = kColorWhite;
        _titleLab.font = kFontSize14;
    }
    return _titleLab;
}

- (YYLabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[YYLabel alloc]init];
        _nameLab.textColor = [UIColor colorWithWhite:1 alpha:0.7];;
        _nameLab.font = kFontSize12;
    }
    return _nameLab;
}

- (UIView *)line{
    if (!_line) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    }
    return _line;
}

- (YYLabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [[YYLabel alloc]init];
        _contentLab.textColor = [UIColor colorWithWhite:1 alpha:0.7];
        _contentLab.font = kFontSize12;
    }
    return _contentLab;
}
@end
