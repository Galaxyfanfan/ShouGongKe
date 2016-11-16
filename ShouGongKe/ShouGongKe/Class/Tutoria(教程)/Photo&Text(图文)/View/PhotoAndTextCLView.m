//
//  PhotoAndTextCLView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/11/16.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "PhotoAndTextCLView.h"
#import "PhotoAndTextCLCell.h"
@interface PhotoAndTextCLView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation PhotoAndTextCLView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView{
    self.backgroundColor = kColorWhite;
    self.delegate = self;
    self.dataSource = self;
    [self registerClass:[PhotoAndTextCLCell class] forCellWithReuseIdentifier:@"PhotoAndTextCLCell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return self.dataSources.count;
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoAndTextCLCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoAndTextCLCell" forIndexPath:indexPath];
    
    return cell;
}

@end
