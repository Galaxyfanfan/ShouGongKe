                                                                                        //
//  HelpTool.m
//  EasyGo
//
//  Created by 鞠凝玮 on 15/7/8.
//  Copyright (c) 2015年 Ju. All rights reserved.
//

#import "HelpTool.h"
#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"
#import "sys/utsname.h"

@implementation HelpTool

//球文本宽高
+ (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize

{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize size = [str boundingRectWithSize:maxSize
                                    options:NSStringDrawingTruncatesLastVisibleLine |
                                            NSStringDrawingUsesLineFragmentOrigin |
                                            NSStringDrawingUsesFontLeading
                                 attributes:dict
                                    context:nil].size;
    
    return size;
}


// * @brief 把格式化的JSON格式的字符

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}



+ (BOOL)isConnectionAvailable{
    
    BOOL isExistenceNetwork;
    YYReachability *reach = [YYReachability reachabilityWithHostname:@"www.baidu.com"];
    switch ([reach status]) {
        case YYReachabilityStatusNone:
            isExistenceNetwork = NO;
            //NSLog(@"notReachable");
            break;
        case YYReachabilityStatusWiFi:
            isExistenceNetwork = YES;
            //NSLog(@"WIFI");
            break;
        case YYReachabilityStatusWWAN:
            isExistenceNetwork = YES;
            //NSLog(@"3G");
            break;
    }
    
    return isExistenceNetwork;
}



//加密 md5和base64
+(NSString *)getMd5_32Bit_String:( NSString *)srcString{
    const char *cStr = [srcString UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    NSData * base64 = [GTMBase64 encodeBytes:digest length:16];
    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
    output=[output stringByReplacingOccurrencesOfString:@"=" withString:@""];
    return output;
}



//手机号码检查
+(BOOL)phoneNumber:(NSString*)number{
    
    if (number.length==8) {
        NSString*no=[number substringWithRange:NSMakeRange(0, 1)];
        if ([no isEqualToString:@"5"]||[no isEqualToString:@"6"]||[no isEqualToString:@"8"]||[no isEqualToString:@"9"]) {
            return YES;
        }
        return NO;
    }
    if (number.length==11) {
        NSString*no=[number substringWithRange:NSMakeRange(0, 2)];
        if ([no isEqualToString:@"13"]||[no isEqualToString:@"14"]||[no isEqualToString:@"15"]||[no isEqualToString:@"18"] ||[no isEqualToString:@"17"] || [no isEqualToString:@"20"] || [no isEqualToString:@"30"]) {
            return YES;
        }
        return NO;
        
    }
    return NO;
}



+(void)archiverData:(id)object key:(NSString*)key
{
    NSData* data       = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:data forKey:key];
    [ud synchronize];
}

+(id)unArchiverData:(NSString*)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData* data       = [ud objectForKey:key];
    id my_object       = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return my_object;
}


+(void)archiverSetValue:(id)value key:(NSString*)key
{
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    [ud setObject:value forKey:key];
    [ud synchronize];
}


+(NSString*)unArchiverValue:(NSString*)key
{
    NSUserDefaults* ud=[NSUserDefaults standardUserDefaults];
    
    return [ud valueForKey:key];
}

+(NSDate *)getDateFromString:(NSString *)string{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    //    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    NSDate *destDate=[[NSDate alloc]init];
    destDate= [dateFormatter dateFromString:string];
    NSDate *endTimeDate=[destDate dateByAddingTimeInterval:28800];
    return endTimeDate;
}


+ (NSString *)stringFromDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}


+(NSMutableString *)getSecureStr :(NSMutableString *)mutbaleStr :(NSString *)str :(NSString *)temp{
    if([str isEqual:[NSNull null]]){
        return [NSMutableString stringWithString:@""];
    }else{
        for(int i=0;i<[str length];i++){
            temp = [str substringWithRange:NSMakeRange(i, 1)];
            if(i<3){
                [mutbaleStr appendString:temp];
            }else if(i==3){
                [mutbaleStr appendString:@"****"];
            }else if (i>str.length-5){
                [mutbaleStr appendString:temp];
            }
        }
        return mutbaleStr;
    }
}

+(BOOL)dataIsNull:(NSString*)sender{
    NSString*str=[NSString stringWithFormat:@"%@",sender];
    if ([str isEqualToString:@"<null>"]||[str isEqualToString:@"(null)"]||sender==nil||[sender isEqualToString:@" "]||[sender isEqualToString:@""]||[sender isEqualToString:@"null"]) {
        //LOG(@"1 transfrom: %@",str);
        return NO;
        
    }else{
        //LOG(@"2 transfrom: %@",recive);
        return YES;
    }
}


//判断日期是今天，昨天还是明天
+(NSString *)compareDate:(NSString *)dateStr :(NSString  *)todayStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    NSDate *today = [dateFormatter dateFromString:todayStr];
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *tomorrow, *yesterday;
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    // 10 first characters of description is the calendar date:
    NSString * todayString = [[today description] substringToIndex:10];
    NSString * yesterdayString = [[yesterday description] substringToIndex:10];
    NSString * tomorrowString = [[tomorrow description] substringToIndex:10];
    NSString * dateString = [[date description] substringToIndex:10];
    if ([dateString isEqualToString:todayString])
    {
        return @"今天";
    } else if ([dateString isEqualToString:yesterdayString])
    {
        return @"昨天";
    }else if ([dateString isEqualToString:tomorrowString])
    {
        return @"明天";
    }
    else
    {
        return dateString;
    }
}

//两个的时间间隔
+(NSString *)intervalFromLastDate: (NSString *) dateString1  toTheDate:(NSString *) dateString2
{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d1=[date dateFromString:dateString1];
    NSTimeInterval late1=[d1 timeIntervalSince1970]*1;
    NSDate *d2=[date dateFromString:dateString2];
    NSTimeInterval late2=[d2 timeIntervalSince1970]*1;
    NSTimeInterval cha=late2-late1;
    NSString *timeString=@"";
    //86400
    timeString = [NSString stringWithFormat:@"%f", cha/1];
    timeString = [timeString substringToIndex:timeString.length-7];
    timeString=[NSString stringWithFormat:@"%@", timeString];
    return timeString;
}

#pragma mark - 多久以前
+ (NSString *)stringIntervalFromLastDate:(NSString *)dateString{
    NSDateFormatter *date=[[NSDateFormatter alloc] init];
    [date setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *compareDate = [date dateFromString:dateString];
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;

    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}



+(BOOL)judgeTimeIsInActivie :(NSString *)systemTime EndTime:(NSString * )endTime BeginTime:(NSString *)beginTimeStr{
   int endInt= [HelpTool compareOneDay:systemTime withAnotherDay:endTime];
    int beginInt= [HelpTool compareOneDay:systemTime withAnotherDay:beginTimeStr];
    if(endInt==-1&&beginInt==1){
        return YES;
    }else{
    return NO;
    }
}


+(NSString *)getNowDate{
    NSDate *datenow = [NSDate date];
    //获取当前进行的属于哪个时间段
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:datenow];
    return oneDayStr;
}


+(int)compareOneDay:(NSString *)oneDayStr withAnotherDay:(NSString *)anotherDayStr
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
//    NSLog(@"date1 : %@, date2 : %@", oneDayStr, anotherDayStr);
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return -1;
    }
    //NSLog(@"Both dates are the same");
    return 0;
}





//对时间数组进行数字排序
- (NSArray *)getTimeSortedArray:(NSArray *)sortArray{
    //排序前
    NSMutableArray *outputBefore = [[NSMutableArray alloc] init];
    for(NSString *str in sortArray){
        [outputBefore addObject:str];
    }
    //排序后
    NSArray *array = [sortArray sortedArrayUsingComparator:timeCmptr];
    NSMutableArray *outputAfter = [[NSMutableArray alloc] init];
    for(NSString *str in array){
        [outputAfter addObject:str];
    }
    return outputAfter;
}


//yyyy-MM-dd HH:mm:ss"
NSComparator timeCmptr = ^(id obj1, id obj2){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateA = [dateFormatter dateFromString:obj1];
    NSDate *dateB = [dateFormatter dateFromString:obj2];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //NSLog(@"Date1  is in the future");
        return (NSComparisonResult)NSOrderedDescending;
        
    }
    else if (result==NSOrderedAscending){
        return (NSComparisonResult)NSOrderedAscending;
        
    }
    return (NSComparisonResult)NSOrderedSame;
};

//秒数转化成时间
+(NSString *)timeFormatted:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

//时间转化成秒数
+(int)getSecFromTime:(NSString *)timeStr{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH:mm:ss"];
        NSDate *curDate = [formatter dateFromString:timeStr];
        NSDate * data2=[formatter dateFromString:@"00:00:00"];
       int timeCount=   [curDate timeIntervalSinceDate:data2];
    return timeCount;
}

+ (BOOL)isLowVersion {
    return  [[[UIDevice currentDevice] systemVersion] floatValue] < 8.2;
}

+(NSString *)getDeviceIdentifier {
    NSString *identifierForVendor = [[UIDevice currentDevice].identifierForVendor UUIDString];
    return identifierForVendor;
}

+(NSString *)changeStrToUtf:(NSString *)str {
    
    
    NSString *newStr0 = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *newStr2 = [newStr0 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return newStr2;
}

+(NSString *)changeStrToChinese:(NSString *)str {
    
    return str;
}
+(NSString *)changeStrSet:(NSString *)str {
    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return newStr;
}

#pragma mark - 当需要改变Label中的多段字体属性时调用
+ (NSMutableAttributedString *)getColorsInLabel:(NSString *)allstring ColorString:(NSArray *)colorStringArray Color:(UIColor *)color fontSize:(CGFloat)size
{
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc]initWithString:allstring];
    
    for (NSString *colorString in colorStringArray) {
        NSRange stringRange = [allstring rangeOfString:colorString];
        NSMutableDictionary *stringDict = [NSMutableDictionary dictionary];
        [stringDict setObject:color forKey:NSForegroundColorAttributeName];
        [stringDict setObject:[UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
        [allString setAttributes:stringDict range:stringRange];
    }
    
    return allString;
}

#pragma mark- 当需要改变Label中得一段字体属性时调用
+ (NSMutableAttributedString *)getOneColorInLabel:(NSString *)allstring ColorString:(NSString *)string Color:(UIColor*)color fontSize:(float)size
{
    
    NSMutableAttributedString *allString = [[NSMutableAttributedString alloc]initWithString:allstring];
    
    NSRange stringRange = [allstring rangeOfString:string];
    NSMutableDictionary *stringDict = [NSMutableDictionary dictionary];
    [stringDict setObject:color forKey:NSForegroundColorAttributeName];
    [stringDict setObject:[UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
    [allString setAttributes:stringDict range:stringRange];
    
    return allString;
    
}

#pragma mark - 根据宽度返回新图片 等比例
+(UIImage *)imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    
    if(CGSizeEqualToSize(imageSize, size) == NO){
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        if(widthFactor > heightFactor){
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        }else if(widthFactor < heightFactor){
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(size);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    if(newImage == nil){
        
        NSLog(@"scale image fail");
    }
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)clipImageInRect:(CGRect)rect withImg:(UIImage *)img
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([img CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return scaledImage;
}

/*
 * Retrieves back the device name or if not the machine name.
 */
+ (NSString*)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machineName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //MARK: More official list is at
    //http://theiphonewiki.com/wiki/Models
    //MARK: You may just return machineName. Following is for convenience
    
    NSDictionary *commonNamesDictionary =
    @{
      @"i386":     @"i386_Simulator",
      @"x86_64":   @"x86_64_Simulator",
      
      @"iPhone1,1":    @"iPhone",
      @"iPhone1,2":    @"iPhone_3G",
      @"iPhone2,1":    @"iPhone_3GS",
      @"iPhone3,1":    @"iPhone_4",
      @"iPhone3,2":    @"iPhone_4(Rev_A)",
      @"iPhone3,3":    @"iPhone_4(CDMA)",
      @"iPhone4,1":    @"iPhone_4S",
      @"iPhone5,1":    @"iPhone_5(GSM)",
      @"iPhone5,2":    @"iPhone_5(GSM+CDMA)",
      @"iPhone5,3":    @"iPhone_5c(GSM)",
      @"iPhone5,4":    @"iPhone_5c(GSM+CDMA)",
      @"iPhone6,1":    @"iPhone_5s(GSM)",
      @"iPhone6,2":    @"iPhone_5s(GSM+CDMA)",
      
      @"iPhone7,1":    @"iPhone_6+(GSM+CDMA)",
      @"iPhone7,2":    @"iPhone_6(GSM+CDMA)",
      
      @"iPhone8,1":    @"iPhone_6S(GSM+CDMA)",
      @"iPhone8,2":    @"iPhone_6S+(GSM+CDMA)",
      @"iPhone8,4":    @"iPhone_SE",
      
      @"iPad1,1":  @"iPad",
      @"iPad2,1":  @"iPad_2(WiFi)",
      @"iPad2,2":  @"iPad_2(GSM)",
      @"iPad2,3":  @"iPad_2(CDMA)",
      @"iPad2,4":  @"iPad_2(WiFi_Rev_A)",
      @"iPad2,5":  @"iPad_Mini_1G_(WiFi)",
      @"iPad2,6":  @"iPad_Mini_1G_(GSM)",
      @"iPad2,7":  @"iPad_Mini_1G_(GSM+CDMA)",
      @"iPad3,1":  @"iPad_3(WiFi)",
      @"iPad3,2":  @"iPad_3(GSM+CDMA)",
      @"iPad3,3":  @"iPad_3(GSM)",
      @"iPad3,4":  @"iPad_4(WiFi)",
      @"iPad3,5":  @"iPad_4(GSM)",
      @"iPad3,6":  @"iPad_4(GSM+CDMA)",
      
      @"iPad4,1":  @"iPad_Air(WiFi)",
      @"iPad4,2":  @"iPad_Air(GSM)",
      @"iPad4,3":  @"iPad_Air(GSM+CDMA)",
      
      @"iPad5,3":  @"iPad_Air_2_(WiFi)",
      @"iPad5,4":  @"iPad_Air_2_(GSM+CDMA)",
      
      @"iPad4,4":  @"iPad_Mini_2G_(WiFi)",
      @"iPad4,5":  @"iPad_Mini_2G_(GSM)",
      @"iPad4,6":  @"iPad_Mini_2G_(GSM+CDMA)",
      
      @"iPad4,7":  @"iPad_Mini_3G_(WiFi)",
      @"iPad4,8":  @"iPad_Mini_3G_(GSM)",
      @"iPad4,9":  @"iPad_Mini_3G_(GSM+CDMA)",
      
      @"iPod1,1":  @"iPod_1st_Gen",
      @"iPod2,1":  @"iPod_2nd_Gen",
      @"iPod3,1":  @"iPod_3rd_Gen",
      @"iPod4,1":  @"iPod_4th_Gen",
      @"iPod5,1":  @"iPod_5th_Gen",
      @"iPod7,1":  @"iPod_6th_Gen",
      };
    
    NSString *deviceName = commonNamesDictionary[machineName];
    
    if (deviceName == nil) {
        deviceName = machineName;
    }
    
    return deviceName;
}

+ (CAShapeLayer *)getCAShapeLayerCornerRadiusRect:(CGRect)rect withRadius:(CGFloat)radius {

    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath;
    return  shapeLayer;
//    _headImgView.layer.mask = shapeLayer;
}
@end
