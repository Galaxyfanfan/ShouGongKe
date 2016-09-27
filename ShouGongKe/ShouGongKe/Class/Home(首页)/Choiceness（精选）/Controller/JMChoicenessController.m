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
    
}

- (void)initViews{
    [self.view addSubview:self.clView];
}







#pragma mark - 懒加载
- (JMChoicenessCLView *)clView{
    if (!_clView) {
        UICollectionViewLayout *layout = [[UICollectionViewLayout alloc]init];
        _clView = [[JMChoicenessCLView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        
    }
    return _clView;
}
@end
