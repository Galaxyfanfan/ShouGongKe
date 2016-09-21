//
//  BaseViewController.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/9.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

+ (UIBarButtonItem *)leftBarButtonWithName:(NSString *)name
                                 imageName:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;
// 设置导航栏右按钮
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name
                                  imageName:(NSString *)imageName
                                     target:(id)target
                                     action:(SEL)action;



- (UIBarButtonItem *)leftBarButtonWithAdd;
- (UIBarButtonItem *)rightBarButtonWithSearch;
@end
