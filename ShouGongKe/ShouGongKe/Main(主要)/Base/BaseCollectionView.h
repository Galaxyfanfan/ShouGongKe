//
//  BaseCollectionView.h
//  ShouGongKe
//
//  Created by maic on 2016/12/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView
@property (nonatomic,copy) void(^reloadBlock)();
@end
