//
//  JMExpertTBCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertTBCell.h"
#import "JMExpertPicCLView.h"
@interface JMExpertTBCell()
@property(nonatomic,strong)UIImageView *headImgView;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)UIButton *attentionBtn;
@property(nonatomic,strong)JMExpertPicCLView *expCLView;
@end
@implementation JMExpertTBCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)setExpModel:(JMExpertModel *)expModel{
    _expModel = expModel;

    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:_expModel.avatar]];
    self.nameLab.text = _expModel.nick_name;
    self.contentLab.text = [NSString stringWithFormat:@"%@图文教程|%@视频教程|%@手工圈",_expModel.course_count,_expModel.video_count,_expModel.opus_count];
    
    self.expCLView.picArr = _expModel.list;
    [self.expCLView reloadData];
}

- (void)initView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.headImgView];
    [self.contentView addSubview:self.nameLab];
    [self.contentView addSubview:self.contentLab];
    [self.contentView addSubview:self.attentionBtn];
    [self.contentView addSubview:self.expCLView];
    
    
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
    [self.expCLView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView.mas_bottom).with.offset(10.0f);
        make.left.equalTo(self.contentView).with.offset(0);
        make.right.equalTo(self.contentView).with.offset(0);
        make.height.equalTo(@(SCREEN_WIDTH/3));
    }];
    
    
    
}

#pragma mark - 懒加载
- (UIImageView *)headImgView{
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc]init];
//        _headImgView.backgroundColor = kBaseRedColor;
        _headImgView.layer.cornerRadius = 20;
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;
}

- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = kFontSize13;
        _nameLab.textColor = kColorBlack;
//        _nameLab.backgroundColor = kBaseRedColor;
    }
    return _nameLab;
}

- (UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [[UILabel alloc]init];
        _contentLab.font = kFontSize11;
        _contentLab.textColor = kColorDarkGray;
//        _contentLab.backgroundColor = kColorDarkGray;
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
- (JMExpertPicCLView *)expCLView{
    if (!_expCLView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _expCLView = [[JMExpertPicCLView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    }
    return _expCLView;
}

@end
