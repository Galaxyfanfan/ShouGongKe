//
//  JMChoicenessHotCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessHotCell.h"
@interface JMChoicenessHotCell()
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *titleLab;
@end
@implementation JMChoicenessHotCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setHotModel:(JMHotTopicModel *)hotModel{
    _hotModel = hotModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:hotModel.pic]];
    self.titleLab.text = hotModel.subject;
}

- (void)initView{

    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.titleLab];
    
    self.imgView.frame = self.bounds;
    self.titleLab.frame = CGRectMake(kSpace, self.imgView.bottom - 30, SCREEN_WIDTH - 2 * kSpace, 30);
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
        _titleLab.textColor = kColorWhite;
        _titleLab.font = kFontSize13;
    }
    return _titleLab;
}
@end
