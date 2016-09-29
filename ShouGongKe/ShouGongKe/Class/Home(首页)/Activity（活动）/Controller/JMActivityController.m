//
//  JMActivityController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMActivityController.h"
#import "JMActivityTBView.h"
@interface JMActivityController ()
@property (nonatomic,strong)JMActivityTBView *tbView;
@end

@implementation JMActivityController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self getHomeActvityData];
}

- (void)initView{
    self.view.backgroundColor = kColorWhite;
    [self.view addSubview:self.tbView];
    
}

- (void)getHomeActvityData{

}



#pragma mark - 懒加载
- (JMActivityTBView *)tbView{
    if (!_tbView) {
        _tbView = [[JMActivityTBView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) style:UITableViewStylePlain];
        
        kSelfWeak;
        _tbView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf getHomeActvityData];
        }];
    }
    return _tbView;
}

@end
