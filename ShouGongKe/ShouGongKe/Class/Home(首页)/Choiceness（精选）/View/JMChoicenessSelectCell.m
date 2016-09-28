//
//  JMChoicenessSelectCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#define kNavSpace 25
#import "JMChoicenessSelectCell.h"
@interface JMChoicenessSelectCell()
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *titleLab;
@end
@implementation JMChoicenessSelectCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setNavModel:(JMNavigationModel *)navModel{
    _navModel = navModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_navModel.pic]];
    self.titleLab.text = _navModel.name;
}

- (void)initView{
    
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLab];
    
    CGFloat width = self.width - 2 * kNavSpace;
    self.imgView.frame = CGRectMake(kNavSpace, (self.width - width - 20)/2.0, width, width);
    self.titleLab.frame = CGRectMake(0, self.imgView.bottom,self.width, 20);
}


#pragma mark - 懒加载
- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
        
        
    }
    return _imgView;
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.textColor = kColorDarkGray;
        _titleLab.font = kFontSize12;
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}
@end
