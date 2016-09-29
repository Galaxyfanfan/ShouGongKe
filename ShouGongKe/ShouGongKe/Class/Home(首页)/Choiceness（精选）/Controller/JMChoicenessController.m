//
//  JMChoicenessController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessController.h"

#import "JMChoicenessCLView.h"

#import "JMChoicenessModel.h"
#import "JMNavigationModel.h"
#import "JMAdvanceModel.h"
#import "JMHotTopicModel.h"
@interface JMChoicenessController ()<JMChoicenessCLViewDelegate>
@property (nonatomic,strong)JMChoicenessCLView *clView;


@end

@implementation JMChoicenessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self loadHomeData];
    
}

- (void)initViews{
    [self.view addSubview:self.clView];
}

- (JMNavigationModel *)addNavigationModel{
    JMNavigationModel *QianDaoModel = [[JMNavigationModel alloc]init];
    QianDaoModel.pic = @"http://image.shougongke.com/app/index/navigation/appIndexNav12.png";
    QianDaoModel.name = @"签到";
    return QianDaoModel;
}
#pragma mark - 数据加载
- (void)loadHomeData{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"c"] = @"index";
    params[@"a"] = @"indexNewest";
    params[@"vid"] = @"18";
    
    kSelfWeak;
    [[SGKManager sharedSGKHttpManager]getHomeChoicenessDataWithGET:params block:^(NSDictionary *json_dic, NSError *error) {
        kSelfStrong;
        [strongSelf.clView.mj_header endRefreshing];
        NSNumber *status = [json_dic objectForKey:kNetworkStatus];
        if([status integerValue] == 1){
            NSArray *dataDic = [json_dic objectForKey:kNetworkData];

            JMChoicenessModel *choicenessModel = [JMChoicenessModel mj_objectWithKeyValues:dataDic];
            
            //添加 签到
            NSMutableArray *navArr = [NSMutableArray arrayWithArray:choicenessModel.navigation];
            [navArr addObject:[self addNavigationModel]];
            choicenessModel.navigation = navArr;
            
            strongSelf.clView.choiceModel = choicenessModel;
            [strongSelf.clView reloadData];
            
            
        }else{
            [WSProgressHUD showImage:nil status:kReturnMsgFailure];
        }
    }];
    
}

#pragma mark - JMChoicenessCLViewDelegate
- (void)JMChoicenessDidSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        NSArray *navArr = self.clView.choiceModel.navigation;
        JMNavigationModel *navModel = navArr[indexPath.row];
        
    }else if(indexPath.section == 2){
        NSArray *advanceArr = self.clView.choiceModel.advance;
        JMAdvanceModel *advanceModel = advanceArr[indexPath.row];
        
    }else if (indexPath.section == 3){
        NSArray *hotArr = self.clView.choiceModel.hotTopic;
        JMHotTopicModel *hotModel = hotArr[indexPath.row];
        
    }
}

#pragma mark - 懒加载
- (JMChoicenessCLView *)clView{
    if (!_clView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

        _clView = [[JMChoicenessCLView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) collectionViewLayout:layout];
        _clView.clDelegate = self;
        kSelfWeak;
        _clView.mj_header = [JMRefreshHeader headerWithRefreshingBlock:^{
            kSelfStrong;
            [strongSelf loadHomeData];
        }];
        
    }
    return _clView;
}
@end
