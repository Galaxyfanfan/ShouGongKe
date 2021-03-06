//
//  JMRefreshFooter.m
//  ShouGongKe
//
//  Created by maic on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMRefreshFooter.h"
@interface JMRefreshFooter()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIActivityIndicatorView *loading;
@end
@implementation JMRefreshFooter

#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor = kColorDarkGray;
    label.font = kFontSize13;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    
    // loading
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:loading];
    self.loading = loading;
}
#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    self.label.frame = self.bounds;
    self.loading.center = CGPointMake(SCREEN_WIDTH * 0.2, self.mj_h * 0.5);
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.label.text = nil;
            [self.loading stopAnimating];
            break;
        case MJRefreshStateRefreshing:
            self.label.text = @"小客正在努力加载";
            [self.loading startAnimating];
            break;
        case MJRefreshStateNoMoreData:
            self.label.text = @"客官,没有数据了呀";
            [self.loading stopAnimating];
            break;
        default:
            break;
    }
}

@end
