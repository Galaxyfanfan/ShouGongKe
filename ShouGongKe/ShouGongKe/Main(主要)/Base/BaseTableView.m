//
//  BaseTableView.m
//  ShouGongKe
//
//  Created by maic on 2016/12/27.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "BaseTableView.h"
@interface BaseTableView()<DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@end
@implementation BaseTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.emptyDataSetDelegate = self;
        self.emptyDataSetSource = self;
        
        self.tableFooterView = [UIView new];
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
