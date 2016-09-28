//
//  JMChoicenessController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessController.h"
#import "JMChoicenessCLView.h"
@interface JMChoicenessController ()
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


- (void)loadHomeData{
    
    
    [[SGKManager sharedSGKHttpManager]getHomeChoicenessDataWithGET:nil block:^(NSDictionary *json_dic, NSError *error) {
        if([[json_dic objectForKey:kNetworkStatus] isEqual:kNetworkStatusSuccess]){
            NSArray *dataArr = [json_dic objectForKey:kNetworkData];
            DLog(@"%@",dataArr);
            
        }else{

        }
    }];
    
}




#pragma mark - 懒加载
- (JMChoicenessCLView *)clView{
    if (!_clView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];

        _clView = [[JMChoicenessCLView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kHomeContentHeight) collectionViewLayout:layout];
        
        
    }
    return _clView;
}
@end
