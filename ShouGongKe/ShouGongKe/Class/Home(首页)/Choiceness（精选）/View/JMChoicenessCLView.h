//
//  JMChoicenessCLView.h
//  ShouGongKe
//
//  Created by maic on 16/9/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JMChoicenessModel.h"
@protocol JMChoicenessCLViewDelegate<NSObject>

- (void)JMChoicenessDidSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface JMChoicenessCLView : UICollectionView

@property (nonatomic,strong)JMChoicenessModel *choiceModel;

@property (nonatomic,weak)id<JMChoicenessCLViewDelegate> clDelegate;

@end
