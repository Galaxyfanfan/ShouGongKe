//
//  BaseManager.h
//  EasyGo
//
//  Created by 鞠凝玮 on 15/7/17.
//  Copyright (c) 2015年 Ju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseManager : NSObject

-(NSURLSessionDataTask *)requestDataWithUrl:(NSString *)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block;
- (NSURLSessionDataTask *)requestDataWithGet:(NSString*)url block:(void(^)(NSDictionary* json_dic,NSError *error))block;
- (NSURLSessionDataTask *)requestDataWithGet:(NSString*)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block;
@end
