//
//  JMChoicenessCLView.m
//  ShouGongKe
//
//  Created by maic on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessCLView.h"
#import "JMChoicenessHotHeaderView.h"

#import "JMChoicenessScrollViewCell.h"
#import "JMChoicenessSelectCell.h"
#import "JMChoicenessRecommendCell.h"
#import "JMChoicenessHotCell.h"
@interface JMChoicenessCLView()<UICollectionViewDelegate,UICollectionViewDataSource>


@end
@implementation JMChoicenessCLView

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
    [self registerClass:[JMChoicenessScrollViewCell class] forCellWithReuseIdentifier:@"JMChoicenessScrollViewCell"];
    [self registerClass:[JMChoicenessSelectCell class] forCellWithReuseIdentifier:@"JMChoicenessSelectCell"];
    [self registerClass:[JMChoicenessRecommendCell class] forCellWithReuseIdentifier:@"JMChoicenessRecommendCell"];
    [self registerClass:[JMChoicenessHotCell class] forCellWithReuseIdentifier:@"JMChoicenessHotCell"];
    [self registerClass:[JMChoicenessHotHeaderView class] forSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:@"JMChoicenessHotHeaderView"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 1) {
        return self.choiceModel.navigation.count;
    }else if(section == 2){
        return self.choiceModel.advance.count;
    }else if(section == 3){
        return self.choiceModel.hotTopic.count;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        JMChoicenessScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMChoicenessScrollViewCell" forIndexPath:indexPath];
        cell.slideArr = self.choiceModel.slide;
        
        return cell;
    }else if(indexPath.section == 1){
        JMChoicenessSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMChoicenessSelectCell" forIndexPath:indexPath];
        
        NSArray *navArr = self.choiceModel.navigation;
        cell.navModel = navArr[indexPath.row];
        
        return cell;
    }else if(indexPath.section == 2){
        JMChoicenessRecommendCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMChoicenessRecommendCell" forIndexPath:indexPath];

        NSArray *advanceArr = self.choiceModel.advance;
        cell.advanceModel = advanceArr[indexPath.row];
        
        return cell;
    }
    
    JMChoicenessHotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMChoicenessHotCell" forIndexPath:indexPath];

    NSArray *hotArr = self.choiceModel.hotTopic;
    cell.hotModel = hotArr[indexPath.row];

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section > 0) {
        if (self.clDelegate && [self.clDelegate respondsToSelector:@selector(JMChoicenessDidSelectItemAtIndexPath:)]) {
            [self.clDelegate JMChoicenessDidSelectItemAtIndexPath:indexPath];
        }
    }
}
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return CGSizeMake((SCREEN_WIDTH - 3 * kSpace)/4.0, (SCREEN_WIDTH - 3 * kSpace)/ 4.0);
    }else if (indexPath.section == 2){
        CGFloat width = SCREEN_WIDTH/2 - 2;
        return CGSizeMake(width, width * 0.7);
    }else if (indexPath.section == 3){
        return CGSizeMake(SCREEN_WIDTH, kHomeContentHeight / 2.5);
    }
    return CGSizeMake(SCREEN_WIDTH, kHomeContentHeight / 3.5);
    
}

//每个item之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section == 1) {
        return kSpace;
    }
    if (section == 2) {
        
        return 4;
    }
    return 0;
}

//每个section中不同行的行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section < 3) {
        
        return 0;
    }
    return 10;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableView = nil;
    if (indexPath.section == 3) {
        if (kind == UICollectionElementKindSectionHeader) {
            JMChoicenessHotHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JMChoicenessHotHeaderView" forIndexPath:indexPath];
            reusableView = headerView;
        }
    }
    return reusableView;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size = CGSizeZero;
    if (section == 3){
        size = CGSizeMake(SCREEN_WIDTH, 40);
    }
    return size;
}


@end
