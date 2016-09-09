//
//  WKWebView+SynchronousEvaluateJavaScript.h
//  EasyGo
//
//  Created by 徐佳琦 on 16/7/26.
//  Copyright © 2016年 Jackie. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (SynchronousEvaluateJavaScript)
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;
@end
