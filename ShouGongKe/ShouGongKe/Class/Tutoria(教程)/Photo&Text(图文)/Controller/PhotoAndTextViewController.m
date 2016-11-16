//
//  Photo&TextViewController.m
//  ShouGongKe
//
//  Created by Galaxy on 16/11/15.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "PhotoAndTextViewController.h"
#import "PhotoAndTextCLView.h"
@interface PhotoAndTextViewController ()
@property (nonatomic,strong)PhotoAndTextCLView *clView;
@end

@implementation PhotoAndTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColorRandom;
    [self.view addSubview:self.clView];
}

- (void)addSelectView{
    UIView *selectView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    selectView.backgroundColor = kColorLightGray;
    [self.view addSubview:selectView];
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
    }
    return _clView;
}

@end
