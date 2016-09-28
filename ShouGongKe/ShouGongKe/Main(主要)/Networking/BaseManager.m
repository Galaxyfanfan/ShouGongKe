//
//  BaseManager.m
//  EasyGo
//
//  Created by 鞠凝玮 on 15/7/17.
//  Copyright (c) 2015年 Ju. All rights reserved.
//

#import "BaseManager.h"
#import "AFAppDotNetAPIClient.h"
#import "NSDictionary+RequestEncoding.h"

@implementation BaseManager

#pragma mark - 获取明星动态
-(NSURLSessionDataTask *)requestDataWithPost:(NSString *)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block{
    

    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n Params == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [parameter jsonEncodedKeyValueString], parameter);

    return [[AFAppDotNetAPIClient sharedClient] POST:url parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *json_dic = (NSDictionary*)responseObject;
        
        DLog(@"\n<<-----------返回--------------------\n Url == %@%@\n Res == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [json_dic jsonEncodedKeyValueString], json_dic);
        
        if (block){
            block(json_dic,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block){
            block(nil,error);
            DLog(@"error===%@",[error description]);
        }
    }];
    
}



- (NSURLSessionDataTask *)requestDataWithGet:(NSString*)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block{
    
    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n Params == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [parameter jsonEncodedKeyValueString], parameter);
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *json_dic = (NSDictionary*)responseObject;
        DLog(@"\n<<-----------返回--------------------\n Url == %@%@\n Res == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [json_dic jsonEncodedKeyValueString], json_dic);
        if (block){
            block(json_dic,nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (block){
            block(nil,error);
        }
    }];
}



-(NSString*) jsonEncodedKeyValueString {
    
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self
                                                   options:0 // non-pretty printing
                                                     error:&error];
    if(error)
        DLog(@"JSON Parsing Error: %@", error);
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
