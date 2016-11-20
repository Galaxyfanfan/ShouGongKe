//
//  HelpTool.h
//  EasyGo
//
//  Created by 鞠凝玮 on 15/7/8.
//  Copyright (c) 2015年 Ju. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface HelpTool : NSObject
//获取设备识别号
+(NSString *)getDeviceIdentifier;
+(NSString *)getNowDate;
//md5加密
+(NSString *)getMd5_32Bit_String:( NSString *)srcString;
//求文本宽高
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize;
+ (BOOL)isConnectionAvailable;
+(NSDate *)getDateFromString:(NSString *)string;
//手机号码检查
+(BOOL)phoneNumber:(NSString*)number;
+(void)archiverData:(id)object key:(NSString*)key;
+(id)unArchiverData:(NSString*)key;
+(void)archiverSetValue:(id)value key:(NSString*)key;
+(NSString*)unArchiverValue:(NSString*)key;

+(NSMutableString *)getSecureStr :(NSMutableString *)mutbaleStr :(NSString *)str :(NSString *)temp;
+(BOOL)dataIsNull:(NSString*)sender;
//两个时间的间隔
+(NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2;
//几分钟/小时/天前
+ (NSString *)stringIntervalFromLastDate:(NSString *)dateString;
+(int)compareOneDay:(NSString *)oneDayStr withAnotherDay:(NSString *)anotherDayStr;
+ (NSString *)timeFormatted:(int)totalSeconds;
+(int)getSecFromTime:(NSString *)timeStr;
+ (NSString *)stringFromDate:(NSDate *)date;
//根据日期求时间
+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
+(BOOL)judgeTimeIsInActivie:(NSString *)systemTime EndTime:(NSString * )endTime BeginTime:(NSString *)beginTimeStr;
//判断日期是今天，昨天还是明天
+(NSString *)compareDate:(NSString *)dateStr :(NSString  *)todayStr;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//是否是低版本 (<8.2)
+ (BOOL)isLowVersion;


//表情上传转码
+(NSString *)changeStrToUtf:(NSString *)str;
//表情显示解码
+(NSString *)changeStrToChinese:(NSString *)str;
//字符串两端去空
+(NSString *)changeStrSet:(NSString *)str;



#pragma mark - 当需要改变Label中的多段字体属性时调用
+ (NSMutableAttributedString *)getColorsInLabel:(NSString *)allstring ColorString:(NSArray *)colorStringArray Color:(UIColor *)color fontSize:(CGFloat)size;
#pragma mark- 当需要改变Label中得一段字体属性时调用
+ (NSMutableAttributedString *)getOneColorInLabel:(NSString *)allstring ColorString:(NSString *)string Color:(UIColor*)color fontSize:(float)size;
//根据宽度返回新图片 等比例
+(UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;
//根据尺寸返回新图片
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
//裁剪图片部分
+ (UIImage *)clipImageInRect:(CGRect)rect withImg:(UIImage *)img;

+ (NSString *)deviceVersion;

//获得圆角
+ (CAShapeLayer *)getCAShapeLayerCornerRadiusRect:(CGRect)rect withRadius:(CGFloat)radius;
@end
