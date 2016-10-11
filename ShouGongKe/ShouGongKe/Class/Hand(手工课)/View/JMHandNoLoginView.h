//
//  JMHandNoLoginView.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/11.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JMHandNoLoginViewDelegate<NSObject>

- (void)goToLogin;

- (void)goToRegist;
@end
@interface JMHandNoLoginView : UIImageView
@property (nonatomic,weak)id<JMHandNoLoginViewDelegate> delegate;
@end
