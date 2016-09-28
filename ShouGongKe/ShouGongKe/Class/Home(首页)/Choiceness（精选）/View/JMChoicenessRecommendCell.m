//
//  JMChoicenessRecommendCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessRecommendCell.h"
@interface JMChoicenessRecommendCell()
@property (nonatomic,strong)UIImageView *imgView;
@end
@implementation JMChoicenessRecommendCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setAdvanceModel:(JMAdvanceModel *)advanceModel{
    _advanceModel = advanceModel;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:advanceModel.pic]];
}

- (void)initView{
    
    [self.contentView addSubview:self.imgView];
    
    self.imgView.frame = self.bounds;
}


#pragma mark - 懒加载
- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
        
        
    }
    return _imgView;
}


@end
