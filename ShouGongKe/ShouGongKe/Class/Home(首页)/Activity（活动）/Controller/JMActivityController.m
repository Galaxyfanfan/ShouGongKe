//
//  JMActivityController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMActivityController.h"
#import "JMActivityTBView.h"
#import "JMActivityModel.h"
@interface JMActivityController ()
@property (nonatomic,strong)JMActivityTBView *tbView;
@property (nonatomic,strong)NSMutableArray *actArr;
@property (nonatomic,copy)NSString *lastId;
@end

@implementation JMActivityController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self getHomeActvityData];
}

- (void)initView{
    self.actArr = [NSMutableArray array];
    
    self.view.backgroundColor = kColorWhite;
    [self.view addSubview:self.tbView];
}

- (void)getHomeActvityData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"activityList";
    params[@"vid"] = @"18";
    if (self.lastId) {
        params[@"id"] = self.lastId;
    }
    
    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeDataWithGET:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        [strongSelf.tbView.mj_header endRefreshing];
        [strongSelf.tbView.mj_footer endRefreshing];
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
            NSArray *dataDic = [json_dic objectForKey:kNetworkData];
            
            for (NSDictionary *dic in dataDic) {
                JMActivityModel *actModel = [JMActivityModel mj_objectWithKeyValues:dic];
                [strongSelf.actArr addObject:actModel];
            }
            JMActivityModel *lastModel = [strongSelf.actArr lastObject];
            strongSelf.lastId = lastModel.id;
            strongSelf.tbView.actArr = strongSelf.actArr;
            [strongSelf.tbView reloadData];
            
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }
    }];

}



#pragma mark - 懒加载
- (JMActivityTBView *)tbView{
    if (!_tbView) {
        _tbView = [[JMActivityTBView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) style:UITableViewStylePlain];
        
        kSelfWeak;
        _tbView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf.actArr removeAllObjects];
            strongSelf.lastId = nil;
            [strongSelf getHomeActvityData];
        }];
        _tbView.mj_footer = [JMRefreshFooter footerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf getHomeActvityData];
        }];
    }
    return _tbView;
}

@end
