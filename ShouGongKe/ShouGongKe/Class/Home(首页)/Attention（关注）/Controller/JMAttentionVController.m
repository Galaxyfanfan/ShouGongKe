//
//  JMAttentionVController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMAttentionVController.h"
#import "JMLoginViewController.H"

#import "JMAttentionNoLoginView.h"
@interface JMAttentionVController ()<JMAttentionNoLoginViewDelegate>
@property (nonatomic,strong)JMAttentionNoLoginView *noLoginView;
@end

@implementation JMAttentionVController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNoLoginView];

}
#pragma mark - 初始化
- (void)addNoLoginView{
    [self.view addSubview:self.noLoginView];
    
    self.noLoginView.frame = self.view.bounds;
}

#pragma mark - 代理方法
- (void)JMAttentionNoLoginViewGotoLogin{
    JMLoginViewController *vc = [[JMLoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - 懒加载
- (JMAttentionNoLoginView *)noLoginView{
    if (!_noLoginView) {
        _noLoginView = [[JMAttentionNoLoginView alloc]init];
        _noLoginView.delegate = self;
    }
    return _noLoginView;
}

@end
