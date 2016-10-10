//
//  JMAdViewController.m
//  ShouGongKe
//
//  Created by maic on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMAdViewController.h"
#import "JMTabBarController.h"
@interface JMAdViewController()
@property (nonatomic,strong)UIImageView *adImgView;

@end
@implementation JMAdViewController

- (void)viewDidLoad{
    [self initView];
    [self loadADData];
}

- (void)initView{
    [self.view addSubview:self.adImgView];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(removeAdImageView) userInfo:nil repeats:NO];
    
}
#pragma mark - 数据加载
- (void)loadADData{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"start";
    params[@"system"] = @"ios";
    params[@"vid"] = @"21";
    
    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeDataWithGET:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
            NSDictionary *dataDic = [json_dic objectForKey:kNetworkData];
            NSDictionary *imgDic = [dataDic objectForKey:@"logoInfo"];
            NSString *imgStr = [imgDic objectForKey:@"big_url"];
            [strongSelf.adImgView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
            
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }
    }];

}


- (void)removeAdImageView{
    [UIView animateWithDuration:2.0f animations:^{
        self.adImgView.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        self.view.backgroundColor = kColorClear;
        
    } completion:^(BOOL finished) {
        [UIApplication sharedApplication].keyWindow.rootViewController = [[JMTabBarController alloc]init];
    }];
    

}

- (UIImageView *)adImgView{
    if (!_adImgView) {
        _adImgView = [[UIImageView alloc]init];
        _adImgView.frame = self.view.bounds;
    }
    return _adImgView;
}





@end
