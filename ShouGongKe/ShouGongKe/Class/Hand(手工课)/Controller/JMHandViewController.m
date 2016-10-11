//
//  JMHandViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMHandViewController.h"
#import "JMLoginViewController.h"
#import "JMRegisterViewController.h"
#import "JMHandNoLoginView.h"
@interface JMHandViewController()<JMHandNoLoginViewDelegate>
@property (nonatomic,strong)JMHandNoLoginView *noLoginView;
@end
@implementation JMHandViewController
- (void)viewDidLoad{
    [super viewDidLoad];

    
    [self.view addSubview:self.noLoginView];
}

#pragma mark - JMHandNoLoginViewDelegate
- (void)goToLogin{
    JMLoginViewController *vc = [[JMLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)goToRegist{
    JMRegisterViewController *vc = [[JMRegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (JMHandNoLoginView *)noLoginView{
    if (!_noLoginView) {
        _noLoginView = [[JMHandNoLoginView alloc]initWithFrame:SCREEN_BOUNDS];
        _noLoginView.delegate = self;
    }
    return _noLoginView;
}

@end
