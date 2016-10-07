//
//  JMRefreshHeader.m
//  ShouGongKe
//
//  Created by maic on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMRefreshHeader.h"

@implementation JMRefreshHeader

- (void)prepare{
    [super prepare];
    
    // 设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=10; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd", i]];
        [idleImages addObject:image];
    }
    [self setImages:idleImages forState:MJRefreshStateIdle];//普通闲置状态
    [self setImages:idleImages forState:MJRefreshStatePulling];//松开就可以进行刷新的状态
    [self setImages:idleImages forState:MJRefreshStateRefreshing];//正在刷新中的状态
    
    [self setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [self setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [self setTitle:@"小客正在刷新" forState:MJRefreshStateRefreshing];
    
    self.stateLabel.textColor = kColorDarkGray;
    self.stateLabel.font = kFontSize13;
    
    self.lastUpdatedTimeLabel.hidden = YES;
}
@end
