//
//  JMAttentionNoLoginView.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JMAttentionNoLoginViewDelegate<NSObject>

- (void)JMAttentionNoLoginViewGotoLogin;

@end


@interface JMAttentionNoLoginView : UIView

@property (nonatomic,weak)id<JMAttentionNoLoginViewDelegate> delegate;

@end
