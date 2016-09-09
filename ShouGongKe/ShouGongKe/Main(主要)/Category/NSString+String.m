//
//  NSString+String.m
//  EasyGo
//
//  Created by 徐佳琦 on 16/4/19.
//  Copyright © 2016年 Ju. All rights reserved.
//

#import "NSString+String.h"

@implementation NSString (String)

+ (BOOL)isNull:(id)obj
{
    BOOL result = NO;
    
    if ([obj isEqual:[NSNull null]] || obj == nil) {
        return YES;
    }
    
    if ([obj isKindOfClass:[NSString class]]) {
        NSString *string = (NSString *)obj;
        if (!string || [string isEqualToString:@""] || 0 == string.length) {
            result = YES;
        } else if ([string isEqualToString:@"null"]) {
            result = YES;
        }
    }
    
    return result;
}

+ (NSString*) uniqueString
{
    CFUUIDRef	uuidObj = CFUUIDCreate(nil);
    NSString	*uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return uuidString;
}

- (NSString*) urlEncodedString {
    
    CFStringRef encodedCFString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                          (__bridge CFStringRef) self,
                                                                          nil,
                                                                          CFSTR("?!@#$^&%*+,:;='\"`<>()[]{}/\\| "),
                                                                          kCFStringEncodingUTF8);
    
    NSString *encodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) encodedCFString];
    
    if(!encodedString)
        encodedString = @"";
    
    return encodedString;
}

- (NSString*) urlDecodedString {
    
    CFStringRef decodedCFString = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                          (__bridge CFStringRef) self,
                                                                                          CFSTR(""),
                                                                                          kCFStringEncodingUTF8);
    
    // We need to replace "+" with " " because the CF method above doesn't do it
    NSString *decodedString = [[NSString alloc] initWithString:(__bridge_transfer NSString*) decodedCFString];
    return (!decodedString) ? @"" : [decodedString stringByReplacingOccurrencesOfString:@"+" withString:@" "];
}


@end
