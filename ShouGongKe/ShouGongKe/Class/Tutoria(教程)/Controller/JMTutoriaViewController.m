//
//  JMTutoriaViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/19.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMTutoriaViewController.h"
#import "PhotoAndTextViewController.h"
#import "VideoViewController.h"
#import "SpecialViewController.h"

#import "GPNavTitleView.h"
#import "GPContainerView.h"
@interface JMTutoriaViewController()

@property (nonatomic,strong)GPNavTitleView *titleView;
@property (nonatomic,strong)GPContainerView *containerView;
@end
@implementation JMTutoriaViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = kBackgroundColor;
    [self setNavTitleView];
    [self addChildVC];
}

- (void)setNavTitleView{
    kSelfWeak;
    self.titleView = [[GPNavTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 0.6, 44) block:^(UIButton *button) {
        kSelfStrong;
        [strongSelf.containerView updateVCViewFromIndex:button.tag];
    }];
    self.navigationItem.titleView = self.titleView;
    
}


- (void)addChildVC{
    
    PhotoAndTextViewController *vc1 = [[PhotoAndTextViewController alloc]init];
    VideoViewController *vc2 = [[VideoViewController alloc]init];
    SpecialViewController *vc3 = [[SpecialViewController alloc]init];
    
    NSArray *vcArr = @[vc1,vc2,vc3];
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    
    kSelfWeak;
    self.containerView = [[GPContainerView alloc]initWithChildControllerS:vcArr selectBlock:^(int index) {
        kSelfStrong;
        [strongSelf.titleView updateSelecterToolsIndex:index];
    }];
    [self.view addSubview:self.containerView];
    self.containerView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
}


@end
