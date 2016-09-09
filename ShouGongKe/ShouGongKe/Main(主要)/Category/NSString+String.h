//
//  NSString+String.h
//  EasyGo
//
//  Created by 徐佳琦 on 16/4/19.
//  Copyright © 2016年 Ju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (String)
+ (BOOL)isNull:(NSString *)string;

+ (NSString*) uniqueString;
- (NSString*) urlEncodedString;
- (NSString*) urlDecodedString;

@end
