//
//  JMChoicenessCLView.m
//  ShouGongKe
//
//  Created by maic on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMChoicenessCLView.h"
#import "JMChoicenessScrollViewCell.h"
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

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JMChoicenessScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JMChoicenessScrollViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor magentaColor];
    
    
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    return nil;
//}
- (void)initViews{
    self.delegate   = self;
    self.dataSource = self;
    
    [self registerClass:[JMChoicenessScrollViewCell class] forCellWithReuseIdentifier:@"JMChoicenessScrollViewCell"];

}

@end
