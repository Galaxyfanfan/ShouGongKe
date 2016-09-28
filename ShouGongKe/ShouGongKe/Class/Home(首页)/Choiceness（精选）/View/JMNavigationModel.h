//
//  JMNavigationModel.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/28.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMNavigationModel : NSObject
@property (nonatomic,copy) NSString *name; // 名字
@property (nonatomic,copy) NSString *type; // 类型
@property (nonatomic,copy) NSString *pic; // 图片
@property (nonatomic,copy) NSString *link_type;
@property (nonatomic,copy) NSString *mob_h5_url; // 链接
@property (nonatomic,copy) NSString *link_info;
@end
