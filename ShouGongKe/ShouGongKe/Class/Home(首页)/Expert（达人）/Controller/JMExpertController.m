//
//  JMExpertController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertController.h"
#import "JMExpertTBView.h"
@interface JMExpertController ()
@property (nonatomic,strong)JMExpertTBView *tbView;
@end

@implementation JMExpertController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self getHomeExpertData];
}

- (void)initView{
    self.view.backgroundColor = kColorWhite;
    [self.view addSubview:self.tbView];
    
}

- (void)getHomeExpertData{
    
}

#pragma mark - 懒加载
- (JMExpertTBView *)tbView{
    if (!_tbView) {
        _tbView = [[JMExpertTBView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) style:UITableViewStylePlain];
        
        kSelfWeak;
        _tbView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf getHomeExpertData];
        }];
    }
    return _tbView;
}

@end
