//
//  UIColor+Extension.m
//  TJDOCBlog
//
//  Created by 汤靖咚 on 15/8/27.
//  Copyright (c) 2015年 Lucifer. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)randomColor {
    
    return [UIColor colorWithRed:arc4random_uniform(256.0) / 255.0 green:arc4random_uniform(256.0) / 255.0 blue:arc4random_uniform(256.0) / 255.0 alpha:0.1];
}

@end
