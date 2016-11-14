//
//  JMTabBarController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMTabBarController.h"

#import "JMHomeViewController.h"
#import "JMTutoriaViewController.h"
#import "JMHandViewController.h"
#import "JMFairViewController.h"
#import "JMMyViewController.h"

#import "YYFPSLabel.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"
@interface JMTabBarController()
@property (nonatomic,strong)UIViewController *vc;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;
@end

@implementation JMTabBarController

- (void)viewDidLoad{
    [self addChildController];
    [self addFPS];
}
- (void)addChildController{
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"JMHomeViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"icon_jiaocheng_",
                                   kSelImgKey : @"icon_jiaocheng_s"},
                                 
                                 @{kClassKey  : @"JMTutoriaViewController",
                                   kTitleKey  : @"教程",
                                   kImgKey    : @"icon_ketang_",
                                   kSelImgKey : @"icon_ketang_s"},
                                 
                                 @{kClassKey  : @"JMHandViewController",
                                   kTitleKey  : @"手工圈",
                                   kImgKey    : @"icon_shougongquan_",
                                   kSelImgKey : @"icon_shougongquan_s"},
                                 
                                 @{kClassKey  : @"JMFairViewController",
                                   kTitleKey  : @"市集",
                                   kImgKey    : @"icon_shiji_",
                                   kSelImgKey : @"icon_shiji_s"},
                                 
                                 @{kClassKey  : @"JMMyViewController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"icon_wode_",
                                   kSelImgKey : @"icon_wode_s"}];
    
    
    //当我们想遍历字典类型的时候, 推荐使用enumerateKeysAndObjectsUsingBlock
    //不仅仅是因为速度快, 更是因为代码更优雅和直观.
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        //如果你的程序中并不存在"kClassKey"这个类，NSClassFromString只是返回一个空对象而已。不写会出错
        self.vc = [[NSClassFromString([dic objectForKey:kClassKey]) alloc]init];
        self.vc.title = [dic objectForKey:kTitleKey];
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:self.vc];
        UITabBarItem *barItem = nav.tabBarItem;
        barItem.title = [dic objectForKey:kTitleKey];
        barItem.image = [UIImage imageNamed:[dic objectForKey:kImgKey]];
        // 始终绘制图片原始状态，不使用Tint Color
        barItem.selectedImage = [[UIImage imageNamed:[dic objectForKey:kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [barItem setTitleTextAttributes:@{NSForegroundColorAttributeName : kBaseRedColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    
    
    
    // 去掉黑线
//    [self.tabBar setShadowImage:[[UIImage alloc] init]];
//    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"bottomTabBar"]];
}


- (void)addFPS{
    _fpsLabel = [YYFPSLabel new];
    [_fpsLabel sizeToFit];
    _fpsLabel.bottom = self.view.height - kSpace - 44;
    _fpsLabel.left = kSpace;
    _fpsLabel.alpha = 1;
    [self.view addSubview:_fpsLabel];
}







@end
