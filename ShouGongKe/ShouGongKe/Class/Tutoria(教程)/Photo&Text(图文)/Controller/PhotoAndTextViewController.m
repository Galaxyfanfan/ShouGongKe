//
//  Photo&TextViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/11/15.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "PhotoAndTextViewController.h"
#import "PhotoAndTextCLView.h"
#import "PhotoAndTextModel.h"
@interface PhotoAndTextViewController ()
@property (nonatomic,strong)PhotoAndTextCLView *clView;
@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,copy)NSString *lastId;
@end

@implementation PhotoAndTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorRandom;
    self.dataArr = [NSMutableArray array];
    [self.view addSubview:self.clView];
    
    [self loadData];
}

- (void)addSelectView{
    UIView *selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    selectView.backgroundColor = kColorLightGray;
    [self.view addSubview:selectView];
}

#pragma mark - 数据加载
- (void)loadData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"Course";
    params[@"a"] = @"newCourseList";
    params[@"gcate"] = @"allcate";
    params[@"vid"] = @"21";
    if (self.lastId) {
        params[@"id"] = self.lastId;
    }
    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeDataWithGET:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        [strongSelf.clView.mj_header endRefreshing];
        [strongSelf.clView.mj_footer endRefreshing];
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
            NSArray *dataDic = [json_dic objectForKey:kNetworkData];
            
            for (NSDictionary *dic in dataDic) {
                PhotoAndTextModel *actModel = [PhotoAndTextModel modelWithJSON:dic];
                [strongSelf.dataArr addObject:actModel];
            }
            PhotoAndTextModel *lastModel = [strongSelf.dataArr lastObject];
            strongSelf.lastId = lastModel.last_id;
            strongSelf.clView.dataSources = strongSelf.dataArr;
            [strongSelf.clView reloadData];
            
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }
    }];
    
}


- (PhotoAndTextCLView *)clView{
    if (!_clView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat itemWidth = (SCREEN_WIDTH - 3 * kSpace)/2;
        layout.itemSize = CGSizeMake(itemWidth, itemWidth * 3 / 2);
        layout.minimumLineSpacing = kSpace;
        layout.minimumInteritemSpacing = kSpace;
        layout.sectionInset = UIEdgeInsetsMake(kSpace, kSpace, kSpace, kSpace);
        _clView = [[PhotoAndTextCLView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - 40 - 44 - 64) collectionViewLayout:layout];
        
        kSelfWeak;
        _clView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf.dataArr removeAllObjects];
            strongSelf.lastId = nil;
            [strongSelf loadData];
        }];
        
        _clView.mj_footer = [JMRefreshFooter footerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf loadData];
        }];
    }
    return _clView;
}

@end
