//
//  Common_define.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/9.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "UIColor+Extension.h"


#ifndef Common_define_h
#define Common_define_h

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kAllHeight          ([UIScreen mainScreen].applicationFrame.size.height + 20.0)
#define kBodyHeight         ([UIScreen mainScreen].applicationFrame.size.height - 44.0)
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds


#define kTopTitleHeight 40
#define kNavBarHeight 64
#define kTabBarHeight 49

#define kHomeContentHeight (SCREEN_HEIGHT - kNavBarHeight - kTabBarHeight - kTopTitleHeight)


/// block self
#define kSelfWeak __weak typeof(self) weakSelf = self
#define kSelfStrong __strong __typeof__(weakSelf) strongSelf = weakSelf

/// Dlog
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#endif /* Common_define_h */
