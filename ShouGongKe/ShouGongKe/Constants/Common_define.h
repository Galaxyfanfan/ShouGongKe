//
//  Common_define.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/9.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#ifndef Common_define_h
#define Common_define_h



/// Dlog
#ifdef DEBUG
#   define DLog(fmt, ...) {NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#   define ELog(err) {if(err) DLog(@"%@", err)}
#else
#   define DLog(...)
#   define ELog(err)
#endif

#endif /* Common_define_h */
