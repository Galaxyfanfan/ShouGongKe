//
//  JMLoginView.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/8.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JMLoginViewDelegate<NSObject>

- (void)pushToRegisterContriller;


@end
@interface JMLoginView : UIView
@property (nonatomic,weak)id<JMLoginViewDelegate> delegate;
@end
