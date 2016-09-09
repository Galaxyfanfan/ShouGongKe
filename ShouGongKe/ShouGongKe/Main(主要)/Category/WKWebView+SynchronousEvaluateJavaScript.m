
//
//  WKWebView+SynchronousEvaluateJavaScript.m
//  EasyGo
//
//  Created by 徐佳琦 on 16/7/26.
//  Copyright © 2016年 Jackie. All rights reserved.
//

#import "WKWebView+SynchronousEvaluateJavaScript.h"

@implementation WKWebView (SynchronousEvaluateJavaScript)

//http://stackoverflow.com/questions/26778955/wkwebview-evaluate-javascript-return-value
- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script
{
    __block NSString *resultString = nil;
    __block BOOL finished = NO;
    
    [self evaluateJavaScript:script completionHandler:^(id result, NSError *error) {
        if (error == nil) {
            if (result != nil) {
                resultString = [NSString stringWithFormat:@"%@", result];
            }
        } else {
            NSLog(@"evaluateJavaScript error : %@", error.localizedDescription);
        }
        finished = YES;
    }];
    
    while (!finished)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    
    return resultString;
}

@end
