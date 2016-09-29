//
//  Common_define.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/9.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#import "UIImageView+AFNetworking.h"
#import "UIColor+Extension.h"
#import "SGKManager.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "WSProgressHUD.h"
#import "JMRefreshHeader.h"
#import "JMRefreshFooter.h"
#import "Masonry.h"

#ifndef Common_define_h
#define Common_define_h
/*  宽高  */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define kAllHeight          ([UIScreen mainScreen].applicationFrame.size.height + 20.0)
#define kBodyHeight         ([UIScreen mainScreen].applicationFrame.size.height - 44.0)
#define SCREEN_BOUNDS [UIScreen mainScreen].bounds

#define kTopTitleHeight 40
#define kNavBarHeight 64
#define kTabBarHeight 49

#define kHomeContentHeight (SCREEN_HEIGHT - kNavBarHeight - kTabBarHeight - kTopTitleHeight)

#define kSpace 10


/*  网络返回字段  */
#define kNetworkStatus @"status"
#define kNetworkInfo @"info"
#define kNetworkData @"data"


/* 网络提示 */
#define kReturnMsgFailure @"服务器开小差去啦"


/*  block self  */
#define kSelfWeak __weak typeof(self) weakSelf = self
#define kSelfStrong __strong __typeof__(weakSelf) strongSelf = weakSelf

/*  Dlog  */
#ifdef DEBUG
//#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
//iOS10.0以上真机调试时NSLog打印不出日志 改用printf
#define DLog(fmt, ...) printf("< Line:(%d) > method: %s \n%s\n", __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(fmt), ##__VA_ARGS__] UTF8String] )

#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#endif /* Common_define_h */
