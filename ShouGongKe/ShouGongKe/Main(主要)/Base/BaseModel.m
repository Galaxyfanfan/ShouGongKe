//
//  BaseModel.m
//  EasyGo
//
//  Created by 徐佳琦 on 16/5/11.
//  Copyright © 2016年 Jackie. All rights reserved.
//

#import "BaseModel.h"
#import "StatusModel.h"
#import "StatusRecordListModel.h"


@implementation BaseModel
#pragma mark - map

+ (instancetype)statusModelRecorListWithKeyValues:(id)keyValues recordListClass:(Class)recordListClass error:(NSError *)error
{
    [[StatusRecordListModel class] mj_setupObjectClassInArray:^NSDictionary *{
        return @{@"recordList":recordListClass};
    }];
    [StatusModel mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
        if ([property.name isEqualToString:@"data"]) {
            if ([oldValue isKindOfClass:[NSDictionary class]]) {
                return [[StatusRecordListModel class] mj_objectWithKeyValues:oldValue];
            }
        }
        return oldValue;
    }];
    
    return [self statusModelWithResponseJson:keyValues error:error];
}

+ (instancetype)statusModelWithKeyValues:(id)keyValues class:(Class)aclass error:(NSError *)error
{
    [StatusModel mj_setupNewValueFromOldValue:^id(id object, id oldValue, MJProperty *property) {
        if ([property.name isEqualToString:@"data"]) {
            if ([oldValue isKindOfClass:[NSDictionary class]]) {
                return [aclass mj_objectWithKeyValues:oldValue];
            } else if ([oldValue isKindOfClass:[NSArray class]]){
                return [aclass mj_objectArrayWithKeyValuesArray:oldValue];
            }
        }
        return oldValue;
    }];
    
    return [self statusModelWithResponseJson:keyValues error:error];
}

+ (instancetype)statusModelWithKeyValues:(id)keyValues error:(NSError *)error
{
    return [StatusModel statusModelWithResponseJson:keyValues error:error];
}

+ (instancetype)statusModelWithResponseJson:(id)Json error:(NSError *)error
{
    if (error.code == -999) {//请求被取消
        return nil;
    }
    
    if (error) {
        return [StatusModel mj_objectWithKeyValues:[self getErrorDictionary:error]];
    } else {
        return [StatusModel mj_objectWithKeyValues:Json];
    }
}

+ (NSDictionary *)getErrorDictionary:(NSError *)error
{
    //判断超时的情况
    BOOL isTimeout = [[error.userInfo objectForKey:@"NSLocalizedDescription"] rangeOfString:@"超时"].location != NSNotFound;
    if (isTimeout) {
        return [NSDictionary dictionaryWithObjectsAndKeys:
                [NSNumber numberWithInteger:kFlagNetTimeOutFlag], @"returnCode",
                @"请求超时，请检查网络",@"returnMsg",
                nil];
    } else {
        return [NSDictionary dictionaryWithObjectsAndKeys:
                [NSNumber numberWithInteger:kFlagNetDisconnectFlag], @"returnCode",
                @"网络异常，请检查网络",@"returnMsg",
                nil];
    }
}

@end
