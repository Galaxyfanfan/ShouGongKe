//
//  JMExpertTBCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertTBCell.h"
@interface JMExpertTBCell()
@property(nonatomic,strong)UIImageView *headImgView;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)UIButton *attentionBtn;
@end
@implementation JMExpertTBCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.attentionBtn];
    
    
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10.0f);
        make.left.equalTo(self.contentView).with.offset(10.0f);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    
    [self.attentionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(15.0f);
        make.right.equalTo(self.contentView).with.offset(-10.0f);
        make.width.equalTo(@60);
        make.height.equalTo(@25);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(10.0f);
        make.left.equalTo(self.headImgView.mas_right).with.offset(10.0f);
        make.right.equalTo(self.attentionBtn.mas_left).with.offset(-10.0f);
        make.height.equalTo(@20);
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom);
        make.left.equalTo(self.headImgView.mas_right).with.offset(10.0f);
        make.right.equalTo(self.attentionBtn.mas_left).with.offset(-10.0f);
        make.height.equalTo(@20);
    }];
    
    
    
}







#pragma mark - 懒加载
- (UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc]init];
        _headImgView.backgroundColor = kBaseRedColor;
        _headImgView.layer.cornerRadius = 20;
    }
    return _headImgView;
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = kFontSize13;
        _nameLab.textColor = kColorBlack;
        _nameLab.backgroundColor = kBaseRedColor;
    }
    return _nameLab;
}

- (UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]init];
        _contentLab.font = kFontSize11;
        _contentLab.textColor = kColorDarkGray;
        _contentLab.backgroundColor = kColorDarkGray;
    }
    return _contentLab;
}

- (UIButton *)attentionBtn{
    if (!_attentionBtn) {
        _attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionBtn setTitle:@"+关注" forState:UIControlStateNormal];
        [_attentionBtn setTitle:@"已关注" forState:UIControlStateSelected];
        [_attentionBtn setTitleColor:kBaseRedColor forState:UIControlStateNormal];
        [_attentionBtn setTitleColor:kColorLightGray forState:UIControlStateSelected];
        _attentionBtn.titleLabel.font = kFontSize13;
        _attentionBtn.layer.cornerRadius = 4;
        _attentionBtn.layer.masksToBounds = YES;
        _attentionBtn.layer.borderWidth = 1.0;
        _attentionBtn.layer.borderColor = kBaseRedColor.CGColor;
        
    }
    return _attentionBtn;
}


@end
