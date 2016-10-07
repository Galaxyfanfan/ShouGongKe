//
//  JMExpertPicCLView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/10/7.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertPicCLView.h"
#import "JMExpertPicCLCell.h"
@interface JMExpertPicCLView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation JMExpertPicCLView


- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews{
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = kColorWhite;

    [self registerClass:[JMExpertPicCLCell class] forCellWithReuseIdentifier:@"JMExpertPicCLCell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JMExpertPicCLCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMExpertPicCLCell" forIndexPath:indexPath];

    if (self.picArr.count > indexPath.row) {
        cell.picModel = self.picArr[indexPath.row];
    }
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    
}

//每个item之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}



@end
