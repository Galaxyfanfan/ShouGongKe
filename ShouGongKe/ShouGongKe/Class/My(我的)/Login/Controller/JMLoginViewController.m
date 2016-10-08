//
//  LoginViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMLoginViewController.h"
#import "JMBaseBackView.h"
#import "JMLoginView.h"
@interface JMLoginViewController()
@property (nonatomic,strong)JMLoginView *loginView;
@end

@implementation JMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
    
}
- (void)initView{
    self.title = @"登录";
    
    UIImageView *bgImgView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bgImgView.backgroundColor = [UIColor orangeColor];
    bgImgView.image = [UIImage imageNamed:@"loginBackground@2x.jpg"];
    [self.view addSubview:bgImgView];
    
    [self.view addSubview:self.loginView];
    self.loginView.center = self.view.center;
    
    JMBaseBackView *backView = [[JMBaseBackView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - kHeight40, SCREEN_WIDTH, kHeight40)];
    [backView backButtonWithTarget:self action:@selector(goToBack)];
    [self.view addSubview:backView];
    
}
- (void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载
- (JMLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[JMLoginView alloc]init];
    }
    return _loginView;
}







@end
