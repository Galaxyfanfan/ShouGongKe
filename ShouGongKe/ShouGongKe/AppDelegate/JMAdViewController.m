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
}

- (void)initView{
    [self.view addSubview:self.adImgView];
    self.adImgView.image = [UIImage imageNamed:@"adimage1"];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(removeAdImageView) userInfo:nil repeats:NO];
    
}
- (void)removeAdImageView{
    [UIView animateWithDuration:0.5f animations:^{
        self.adImgView.transform = CGAffineTransformMakeScale(1.5f, 1.5f);
        self.adImgView.alpha = 0.f;
        
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
