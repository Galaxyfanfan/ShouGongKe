//
//  JMChoicenessController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/25.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessController.h"

@interface JMChoicenessController ()
@property (nonatomic,strong)UICollectionView *clView;

@end

@implementation JMChoicenessController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor orangeColor];
}









#pragma mark - 懒加载
- (UICollectionView *)clView{
    if (!_clView) {
        
    }
    return _clView;
}
@end
