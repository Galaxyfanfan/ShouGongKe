//
//  JMRegisterViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/10.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMRegisterViewController.h"
#import "JMBaseBackView.h"
#import "JMRegisterView.h"
@interface JMRegisterViewController ()<JMRegisterViewDelegate>
@property (nonatomic,strong)JMRegisterView *regView;
@end

@implementation JMRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
}
- (void)initView{
    self.title = @"登录";
    
    UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImgView.backgroundColor = [UIColor orangeColor];
    bgImgView.image = [UIImage imageNamed:@"registerBackground@2x.jpg"];
    bgImgView.userInteractionEnabled = YES;
    kSelfWeak;
    [bgImgView zzh_addTapGestureWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        kSelfStrong;
        [strongSelf resignCurrentFirstResponder];
    }];
    [self.view addSubview:bgImgView];
    
    [self.view addSubview:self.regView];
    self.regView.center = self.view.center;
    
    JMBaseBackView *backView = [[JMBaseBackView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - kHeight40, SCREEN_WIDTH, kHeight40)];
    [backView backButtonWithTarget:self action:@selector(goToBack)];
    [self.view addSubview:backView];
    
}

- (void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma  mark - JMRegisterViewDelegate
- (void)goBack{
    [self goToBack];
}

- (void)getCodeWithPhone:(NSString *)phoneNum{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Login";
    params[@"a"] = @"getVerify";
//    params[@"phone"] = phoneNum;
    //由于不知道需要传的手机号字段是什么，所以无法获取验证码
    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeDataWithGET:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
        
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }
    }];

}

- (void)goToRegist:(NSDictionary *)dic{

}


#pragma mark - 懒加载
- (JMRegisterView *)regView{
    if (!_regView) {
        _regView = [[JMRegisterView alloc]init];
        _regView.delegate = self;
    }
    return _regView;
}




@end
