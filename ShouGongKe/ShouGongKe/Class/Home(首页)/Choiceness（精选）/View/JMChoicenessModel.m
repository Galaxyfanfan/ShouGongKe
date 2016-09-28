//
//  JMChoicenessModel.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/28.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessModel.h"
#import "JMSlideModel.h"
#import "JMNavigationModel.h"
#import "JMAdvanceModel.h"
#import "JMHotTopicModel.h"

@implementation JMChoicenessModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"slide" : [JMSlideModel class],
             @"hotTopic" : [JMHotTopicModel class],
             @"navigation" : [JMNavigationModel class],
             @"advance" : [JMAdvanceModel class]
             };
}
@end
