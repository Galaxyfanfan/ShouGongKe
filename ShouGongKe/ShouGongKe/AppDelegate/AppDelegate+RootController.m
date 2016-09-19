//
//  AppDelegate+RootController.m
//  ShouGongKe
//
//  Created by maic on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "AppDelegate+RootController.h"
#import "JMAdViewController.h"
@implementation AppDelegate (RootController)

- (void)setAppWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UIApplication sharedApplication]setStatusBarHidden:NO];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //设置指示器的联网动画
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)setRootViewController{
    JMAdViewController *vc = [[JMAdViewController alloc]init];
    self.window.rootViewController = vc;
}

- (void)createLoadingScrollView
{
    //引导页实例
}
@end
