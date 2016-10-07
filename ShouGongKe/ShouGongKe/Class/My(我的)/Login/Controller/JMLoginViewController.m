//
//  LoginViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMLoginViewController.h"
#import "JMBaseBackView.h"
@interface JMLoginViewController()

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
    
    JMBaseBackView *backView = [[JMBaseBackView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 40, SCREEN_WIDTH, 40)];
    [backView backButtonWithTarget:self action:@selector(goToBack)];
    [self.view addSubview:backView];
    
}
- (void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
