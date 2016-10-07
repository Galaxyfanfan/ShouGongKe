//
//  JMExpertModel.h
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMExpertModel : NSObject

@property (nonatomic,copy) NSString *nick_name; // 昵称
@property (nonatomic,copy) NSString *user_id; // 用户id
@property (nonatomic,copy) NSString *avatar; // 用户头像
@property (nonatomic,copy) NSString *course_count; //图文教程数
@property (nonatomic,copy) NSString *video_count; //视频数
@property (nonatomic,copy) NSString *opus_count; //手工圈数
@property (nonatomic,copy) NSString *is_daren; //是否是达人
@property (nonatomic,copy) NSString *guan_status; //是否关注
@property (nonatomic,copy) NSString *course_time; //时间
@property (nonatomic,copy) NSString *tb_url; //淘宝链接

@property (nonatomic,strong)NSArray *list;//数组



/*  
 avatar = "http://imgs.shougongke.com/bridge/data/avatar/016/49/25/70_avatar_big.jpg@66w_66h?t=1473751427";
 "course_count" = 10;
 "course_time" = 1475732823;
 "guan_status" = 0;
 "is_daren" = 1;
 list =             (
 {
 "hand_id" = 307536;
 "host_pic" = "http://imgs.shougongke.com//Public/data/hand/201604/14/host/146061810251654_593.jpg";
 },
 {
 "hand_id" = 306808;
 "host_pic" = "http://imgs.shougongke.com//Public/data/hand/201604/12/host/146043277186152_593.jpg";
 },
 {
 "hand_id" = 305050;
 "host_pic" = "http://imgs.shougongke.com//Public/data/hand/201604/08/host/146006483158802_593.jpg";
 }
 );
 "nick_name" = jojo;
 "opus_count" = 262;
 "tb_url" = "";
 "user_id" = 16492570;
 "video_count" = 2;
 "vip_info" =             {
 formatTime = "2017-08-16 \U4f1a\U5458\U5230\U671f";
 "vip_type" = 2;
 };

 
 */

@end
