//
//  JMActivityTBCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMActivityTBCell.h"
@interface JMActivityTBCell()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *typeLab;
@property(nonatomic,strong)UILabel *timeLab;
@end

@implementation JMActivityTBCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.typeLab];
    [self.contentView addSubview:self.timeLab];
    
    
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).with.offset(0);
        make.left.equalTo(self.contentView).with.offset(0);
        make.width.equalTo(@(SCREEN_WIDTH));
        make.height.equalTo(@140);
    }];

    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).with.offset(5.0f);
        make.left.equalTo(self.contentView).with.offset(10.0f);
        make.right.equalTo(self.contentView).with.offset(-10.0f);
        make.height.equalTo(@20);
    }];
    
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).with.offset(-10.0f);
        make.right.equalTo(self.contentView).with.offset(-10.0f);
        make.height.equalTo(@20);
        make.width.equalTo(@60);
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).with.offset(5.0f);
        make.left.equalTo(self.contentView).with.offset(10.0f);
        make.right.equalTo(self.typeLab.mas_left).with.offset(-10.0f);
        make.height.equalTo(@20);
    }];
    
    
    
}







#pragma mark - 懒加载
- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
        _imgView.backgroundColor = kBaseRedColor;
    }
    return _imgView;
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.font = kFontSize13;
        _titleLab.textColor = kColorBlack;
        _titleLab.backgroundColor = [UIColor yellowColor];
    }
    return _titleLab;
}
- (UILabel *)typeLab{
    if (!_typeLab) {
        _typeLab = [[UILabel alloc]init];
        _typeLab.font = kFontSize13;
        _typeLab.textColor = kColorBlack;
        _typeLab.backgroundColor = kBaseRedColor;
    }
    return _typeLab;
}
- (UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [[UILabel alloc]init];
        _timeLab.font = kFontSize11;
        _timeLab.textColor = kColorDarkGray;
        _timeLab.backgroundColor = kColorDarkGray;
    }
    return _timeLab;
}




@end
