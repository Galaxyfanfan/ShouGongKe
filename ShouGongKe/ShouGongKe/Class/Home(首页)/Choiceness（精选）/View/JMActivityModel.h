//
//  JMActivityModel.h
//  ShouGongKe
//
//  Created by Galaxy on 16/10/6.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMActivityModel : NSObject


@property (nonatomic,copy) NSString *id; // id
@property (nonatomic,copy) NSString *c_name; // 活动名
@property (nonatomic,copy) NSString *m_logo; // 图片
@property (nonatomic,copy) NSString *c_time; // 时间
@property (nonatomic,copy) NSString *c_status; // 活动状态 0 即将开始 1 进行中 2 已结束


@end
