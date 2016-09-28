//
//  BaseModel.h
//  EasyGo
//
//  Created by 徐佳琦 on 16/5/11.
//  Copyright © 2016年 Jackie. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StatusModel;

@interface BaseModel : NSObject


/**
 *  @brief JSON映射模型,无data
 *
 *  @param keyValues JSON
 *  @param error     网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */

+ (instancetype)statusModelWithKeyValues:(id)keyValues error:(NSError *)error;

/**
 *  @brief JSON映射模型,data层对应着模型数组
 *
 *  @param keyValues JSON
 *  @param aclass    data数组中对应的Model Class
 *  @param error     网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */
+ (instancetype)statusModelWithKeyValues:(id)keyValues class:(Class)aclass error:(NSError *)error;

/**
 *  @brief JSON映射模型,当为列表时使用，data层对应totalCount,RecordList等。
 *
 *  @param keyValues       JSON
 *  @param recordListClass RecordList对应的Model Class
 *  @param error           网络请求返回的error，根据此error判断超时或网络异常
 *
 *  @return Status对象
 */
+ (instancetype)statusModelRecorListWithKeyValues:(id)keyValues recordListClass:(Class)recordListClass error:(NSError *)error;
@end
