//
//  JMRegisterView.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/10.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JMRegisterViewDelegate<NSObject>

- (void)goBack;

- (void)getCodeWithPhone:(NSString *)phoneNum;

- (void)goToRegist:(NSDictionary *)dic;
@end

@interface JMRegisterView : UIView

@property (nonatomic,weak)id<JMRegisterViewDelegate> delegate;

@end
