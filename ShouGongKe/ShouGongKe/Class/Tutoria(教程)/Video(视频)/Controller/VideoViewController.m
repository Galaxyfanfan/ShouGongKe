//
//  VideoViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/11/15.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorRandom;
    
    
    NSString *str = @"节省电话费看到你 看东方航空师范类事件佛的咖啡机诶 i做客服，圣诞节色好看啃 看航空烈士纠纷法律实施负利率看呢份 i 司法局科技护肤课 if 是你，俄方快快减肥快减肥可 u 恶化紧身裤和科技等你分手是狂风巨浪思考自己发 i 人了家sfds.kfhfejh 真的看航空贼金额看看吗jherskeujnfs.eirh值的空间合理结束了 说可人如水流绕了； ";
    
    YYLabel *lab = [[YYLabel alloc]initWithFrame:CGRectMake(15, 150, SCREEN_WIDTH - 30, 50)];
    lab.font = kFontSize13;
    lab.numberOfLines = 3;
    lab.text = str;
    [self.view addSubview:lab];
    
    CGSize strSize = [HelpTool sizeWithString:str font:kFontSize13 maxSize:lab.size];
    DLog(@"%f   %f",strSize.width,strSize.height);
    
}


@end
