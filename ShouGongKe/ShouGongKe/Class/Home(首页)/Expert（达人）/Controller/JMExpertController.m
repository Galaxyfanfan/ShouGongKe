//
//  JMExpertController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertController.h"
#import "JMExpertTBView.h"
#import "JMExpertModel.h"
@interface JMExpertController ()
@property (nonatomic,strong)JMExpertTBView *tbView;
@property (nonatomic,strong)NSMutableArray *expArr;
@property (nonatomic,copy)NSString *lastId;
@end

@implementation JMExpertController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self getHomeExpertData:@"up"];
}

- (void)initView{
    self.expArr = [NSMutableArray array];
    
    self.view.backgroundColor = kColorWhite;
    [self.view addSubview:self.tbView];
    
}

- (void)getHomeExpertData:(NSString *)actStr{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"daren";
    
    params[@"act"] = actStr;
    params[@"vid"] = @"18";
    if (self.lastId) {
        params[@"last_id"] = self.lastId;
    }
    params[@"u"] = @"17460367";

    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeDataWithPOST:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        [strongSelf.tbView.mj_header endRefreshing];
        [strongSelf.tbView.mj_footer endRefreshing];
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
            NSArray *dataDic = [json_dic objectForKey:kNetworkData];
            
            for (NSDictionary *dic in dataDic) {
                JMExpertModel *actModel = [JMExpertModel mj_objectWithKeyValues:dic];
                [strongSelf.expArr addObject:actModel];
            }
            JMExpertModel *lastModel = [strongSelf.expArr lastObject];
            strongSelf.lastId = lastModel.course_time;
            strongSelf.tbView.expArr = strongSelf.expArr;
            [strongSelf.tbView reloadData];
            
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }

    }];

}

#pragma mark - 懒加载
- (JMExpertTBView *)tbView{
    if (!_tbView) {
        _tbView = [[JMExpertTBView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) style:UITableViewStylePlain];
        
        kSelfWeak;
        _tbView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf.expArr removeAllObjects];
            strongSelf.lastId = nil;

            [strongSelf getHomeExpertData:@"up"];
        }];

        _tbView.mj_footer = [JMRefreshFooter footerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf getHomeExpertData:@"down"];
        }];
    }
    return _tbView;
}

@end
