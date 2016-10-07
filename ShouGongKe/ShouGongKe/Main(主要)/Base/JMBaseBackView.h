//
//  JMBaseBackView.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JMBaseBackView : UIView
@property (nonatomic,strong)UIButton *backBtn;
- (void)backButtonWithTarget:(id)target
                      action:(SEL)action;

@end
