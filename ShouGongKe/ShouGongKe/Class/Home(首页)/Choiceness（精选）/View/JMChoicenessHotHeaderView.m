//
//  JMChoicenessHotHeaderView.m
//  ShouGongKe
//
//  Created by maic on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessHotHeaderView.h"
@interface JMChoicenessHotHeaderView()

@end
@implementation JMChoicenessHotHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height/2, self.width, 1)];
    lineView.backgroundColor = kColorLightGray;
    [self addSubview:lineView];
    
    UILabel *hotLab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 80)/2, 0, 80, self.height)];
    hotLab.text = @"热门专题";
    hotLab.font = kFontSize13;
    hotLab.textAlignment = NSTextAlignmentCenter;
    hotLab.textColor = kColorDarkGray;
    hotLab.backgroundColor = kColorWhite;
    [self addSubview:hotLab];
}
@end
