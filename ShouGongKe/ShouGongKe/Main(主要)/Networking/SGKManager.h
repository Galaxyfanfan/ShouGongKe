//
//  SGKManager.h
//  ShouGongKe
//
//  Created by maic on 16/9/28.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "BaseManager.h"

@interface SGKManager : BaseManager
+ (instancetype)sharedSGKHttpManager;


-(void)getHomeChoicenessDataWithGET:(NSDictionary*)parameter block:(void(^)(NSDictionary *json_dic,NSError *error))block;
@end
