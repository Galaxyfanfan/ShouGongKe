//
//  SGKManager.m
//  ShouGongKe
//
//  Created by maic on 16/9/28.
//  Copyright © 2016年 Galaxy. All rights reserved.
//
#import "SGKManager.h"
//
static NSString *const getHomeChoicenessData = @"index.php";

@implementation SGKManager

+ (instancetype)sharedSGKHttpManager{
    static SGKManager *_sharedSGKHttpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSGKHttpManager = [[self alloc]init];
    });
    return _sharedSGKHttpManager;
}

-(void)getHomeDataWithGET:(NSDictionary*)parameter block:(void(^)(NSDictionary *json_dic,NSError *error))block{
    [super requestDataWithGet:getHomeChoicenessData parameter:parameter block:^(NSDictionary *json_dic,NSError *error) {
        block(json_dic,error);
    }];
}
-(void)getHomeDataWithPOST:(NSDictionary*)parameter block:(void(^)(NSDictionary *json_dic,NSError *error))block{
    [super requestDataWithPost:getHomeChoicenessData parameter:parameter block:^(NSDictionary *json_dic,NSError *error) {
        block(json_dic,error);
    }];
}
@end
