  //
//  JMExpertPicCLCell.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertPicCLCell.h"
@interface JMExpertPicCLCell()
@property (nonatomic,strong)UIImageView *imgView;
@end
@implementation JMExpertPicCLCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)setPicModel:(JMExpertPicModel *)picModel{
    _picModel = picModel;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_picModel.host_pic]];
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
