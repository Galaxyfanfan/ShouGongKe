//
//  JMExpertModel.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertModel.h"
#import "JMExpertPicModel.h"
@implementation JMExpertModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"list" : [JMExpertPicModel class]};
}
@end
