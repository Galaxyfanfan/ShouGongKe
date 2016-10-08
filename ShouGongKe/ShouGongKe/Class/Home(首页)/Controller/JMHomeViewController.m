//
//  JMHomeViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMHomeViewController.h"

#import "JMChoicenessController.h"
#import "JMAttentionVController.h"
#import "JMExpertController.h"
#import "JMActivityController.h"
@interface JMHomeViewController()

@end
@implementation JMHomeViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setNavBarButton];
    
    [self setUpTitleEffect];
    
    [self addChildController];
}
- (void)setNavBarButton{
    self.navigationItem.leftBarButtonItem = [self leftBarButtonWithAdd];
    self.navigationItem.rightBarButtonItem = [self rightBarButtonWithSearch];
}

- (void)setUpTitleEffect{
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *titleScrollViewColor = kColorWhite;
        *norColor = kColorDarkGray;
        *selColor = kBaseRedColor;
        *titleFont = kFontSize14;
        *titleHeight = kHeight40;
    }];
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        *underLineH = 1.5;
        *underLineColor = kBaseRedColor;
    }];
}

- (void)addChildController{
    JMChoicenessController *vc1 = [[JMChoicenessController alloc]init];
    vc1.title = @"精选";
    [self addChildViewController:vc1];
    
    JMAttentionVController *vc2 = [[JMAttentionVController alloc]init];
    vc2.title = @"关注";
    [self addChildViewController:vc2];
    
    JMExpertController *vc3 = [[JMExpertController alloc]init];
    vc3.title = @"达人";
    [self addChildViewController:vc3];
    
    JMActivityController *vc4 = [[JMActivityController alloc]init];
    vc4.title = @"活动";
    [self addChildViewController:vc4];
}

@end
