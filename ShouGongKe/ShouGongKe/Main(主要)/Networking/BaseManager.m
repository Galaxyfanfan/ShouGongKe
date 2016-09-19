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
-(NSURLSessionDataTask *)requestDataWithUrl:(NSString *)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block{
    

    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n Params == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [parameter jsonEncodedKeyValueString], parameter);

//    NSDictionary *mutableParams = [NSMutableDictionary dictionaryWithDictionary:parameter];
//    [mutableParams setValue:GetAppBundleVersion forKey:@"appversion"];
//    
//    [mutableParams setValue:@"1" forKey:@"platformtype"];
//    [mutableParams setValue:[NSString stringWithFormat:@"%.1f",kSystermVersion] forKey:@"osversion"];
//    [mutableParams setValue:[HelpTool deviceVersion] forKey:@"machinemodel"];
//    
//    if ([GetDataManager.userId isEqualToString:@""]) {
//        [mutableParams setValue:@"0" forKey:@"uid"];
//    } else {
//        [mutableParams setValue:GetDataManager.userId forKey:@"uid"];
//    }
//    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n Params == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [mutableParams jsonEncodedKeyValueString], mutableParams);
    
    return [[AFAppDotNetAPIClient sharedClient] POST:url parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        NSDictionary *json_dic = (NSDictionary*)responseObject;
        
        DLog(@"\n<<-----------返回--------------------\n Url == %@%@\n Res == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [json_dic jsonEncodedKeyValueString], json_dic);
        
        if (block){
            block(json_dic,nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (block){
            block(nil,error);
            DLog(@"error===%@",[error description]);
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

- (NSURLSessionDataTask *)requestDataWithGet:(NSString*)url block:(void(^)(NSDictionary* json_dic,NSError *error))block{
    
//    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n------------------------------->>", EasyGo_BASE_URL, url);
       return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:nil success:^(NSURLSessionDataTask * task, id responseObject) {
            NSDictionary *json_dic = (NSDictionary*)responseObject;
//            DLog(@"\n<<-----------返回--------------------\n Url == %@%@\n Res == %@\n DicStyle == %@\n------------------------------->>", EasyGo_BASE_URL, url, [json_dic jsonEncodedKeyValueString], json_dic);
            if (block){
                block(json_dic,nil);
            }

        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            if (block){
                block(nil,error);
            }
        }];
}



- (NSURLSessionDataTask *)requestDataWithGet:(NSString*)url parameter:(NSDictionary*)parameter block:(void(^)(NSDictionary* json_dic,NSError *error))block{
    
    DLog(@"\n<<-----------请求-------------------\n Url == %@%@\n Params == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [parameter jsonEncodedKeyValueString], parameter);
    
    return [[AFAppDotNetAPIClient sharedClient]GET:url parameters:parameter success:^(NSURLSessionDataTask * task, id responseObject) {
            NSDictionary *json_dic = (NSDictionary*)responseObject;
            DLog(@"\n<<-----------返回--------------------\n Url == %@%@\n Res == %@\n DicStyle == %@\n------------------------------->>", SGK_BASE_URL, url, [json_dic jsonEncodedKeyValueString], json_dic);
            if (block){
                block(json_dic,nil);
            }
        
        } failure:^(NSURLSessionDataTask * task, NSError * error) {
            if (block){
                block(nil,error);
            }
        }];
}

@end
