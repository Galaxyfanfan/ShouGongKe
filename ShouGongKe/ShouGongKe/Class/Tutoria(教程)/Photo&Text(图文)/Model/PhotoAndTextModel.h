//
//  PhotoAndTextModel.h
//  ShouGongKe
//
//  Created by Galaxy on 16/11/17.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoAndTextModel : NSObject

@property (nonatomic,strong) NSString *bg_color; //
@property (nonatomic,assign) NSInteger collect; //
@property (nonatomic,copy) NSString *hand_id; //
@property (nonatomic,copy) NSString *host_pic; //
@property (nonatomic,copy) NSString *host_pic_color; //
@property (nonatomic,copy) NSString *is_new; //
@property (nonatomic,copy) NSString *last_id; //
@property (nonatomic,copy) NSDictionary *shopping; //
@property (nonatomic,copy) NSString *subject; //
@property (nonatomic,copy) NSString *user_id; //
@property (nonatomic,copy) NSString *user_name; //
@property (nonatomic,assign) NSInteger view; //

/*
"bg_color" = "#7E7A61";
collect = 15;
"hand_id" = 381603;
"host_pic" = "http://imgs.shougongke.com/course/16740315/381603/161117170517_cover.jpg";
"host_pic_color" = "#7E7A61";
"is_new" = 1;
"last_id" = 20;
shopping =             {
    "is_sale_material" = 1;
    "is_sale_pro" = 0;
    "price_material" = "109.00";
    "price_pro" = "0.00";
};
subject = "\U590d\U53e4\U7eff\U677e\U77f3\U624b\U94fe";
"user_id" = 16740315;
"user_name" = "\U55b5\U55b5\U7684\U5c0f\U7c89\U722a";
view = 354;
*/

@end
