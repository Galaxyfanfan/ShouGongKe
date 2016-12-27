//
//  BaseCollectionView.m
//  ShouGongKe
//
//  Created by maic on 2016/12/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "BaseCollectionView.h"

@interface BaseCollectionView()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end
@implementation BaseCollectionView
- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.emptyDataSetDelegate = self;
        self.emptyDataSetSource = self;
    }
    return self;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView{
    return kColorWhite;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    return [UIImage imageNamed:@"login_icon_weibo"];
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button{
    //刷新页面
    if (self.reloadBlock) {
        self.reloadBlock();
    }
}


@end
