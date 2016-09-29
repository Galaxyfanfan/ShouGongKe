//
//  JMChoicenessScrollViewCell.m
//  ShouGongKe
//
//  Created by maic on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessScrollViewCell.h"
#import "SDCycleScrollView.h"
#import "JMSlideModel.h"
@interface JMChoicenessScrollViewCell()<SDCycleScrollViewDelegate>
@property (nonatomic,strong)SDCycleScrollView *adScrollView;//
@property (nonatomic,strong)NSMutableArray *imgArr;//
@end
@implementation JMChoicenessScrollViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        
    }
    return self;
}

- (void)setSlideArr:(NSArray *)slideArr{
    _slideArr = slideArr;
    
    [self.imgArr removeAllObjects];
    for (JMSlideModel *slideModel in _slideArr) {
        [self.imgArr addObject:slideModel.host_pic];
    }

    self.adScrollView.imageURLStringsGroup = self.imgArr;
    
}

- (void)initView{
    [self.contentView addSubview:self.adScrollView];
    self.imgArr = [NSMutableArray array];
}

#pragma mark - 滑动视图 代理
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{

}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{

}

#pragma mark - 懒加载
- (SDCycleScrollView *)adScrollView{
    if (!_adScrollView) {
        _adScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:nil];
        _adScrollView.autoScrollTimeInterval = 4;
        _adScrollView.currentPageDotColor = kBaseRedColor;
        _adScrollView.pageDotColor = kColorWhite;
    }
    return _adScrollView;
}

@end
