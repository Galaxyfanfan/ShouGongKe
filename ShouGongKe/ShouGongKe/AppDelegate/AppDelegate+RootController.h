//
//  AppDelegate+RootController.h
//  ShouGongKe
//
//  Created by maic on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
//app的跟视图控制器实例
#import "AppDelegate.h"

@interface AppDelegate (RootController)
/**
 *  首次启动轮播图
 */
//- (void)createLoadingScrollView;
/**
 *  tabbar实例
 */
//- (void)setTabbarController;

/**
 *  window实例
 */
- (void)setAppWindows;

/**
 *  设置根视图
 */
- (void)setRootViewController;
@end
