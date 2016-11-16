//
//  GPNavTitleView.m
//  GPHandMade
//
//  Created by dandan on 16/6/29.
//  Copyright © 2016年 dandan. All rights reserved.
//

#import "GPNavTitleView.h"
@interface GPNavTitleView()
@property (nonatomic, strong) UIButton * previousBtn;
@property (nonatomic, strong) UIButton * currentBtn;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *btnArray;
@property (nonatomic,copy) NavTitleClickBlock navtitleClickBlock;
@end
@implementation GPNavTitleView

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame andTitleArr:(NSArray *)titleArr block:(NavTitleClickBlock)block
{
    if (self = [super initWithFrame:frame]) {
        self.titleArray = titleArr;
        [self addChildView];
//        [self addlayout];
        self.navtitleClickBlock = block;
    }
    return self;
}
- (NSMutableArray *)btnArray
{
    if (!_btnArray) {
        
        _btnArray = [[NSMutableArray alloc] init];
    }
    return _btnArray;
}
// 添加子控件
- (void)addChildView
{
    CGFloat itemWidth = self.width / self.titleArray.count;
    for (int i = 0; i < self.titleArray.count; i ++) {
        UIButton *NavBtn = [[UIButton alloc]init];
        NavBtn.frame = CGRectMake(i * itemWidth, 0, itemWidth, self.height);
        NavBtn.tag = i;
        [NavBtn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        NavBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [NavBtn setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateNormal];
        [NavBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [NavBtn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.btnArray addObject:NavBtn];
        [self addSubview:NavBtn];
        
        if (i > 0) {
            UIView *lineView = [[UIView alloc]init];
            lineView.frame = CGRectMake(i * itemWidth, (self.height - 20)/2, 1, 20);
            lineView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
            [self addSubview:lineView];
        }
    }
}

// 按钮回调
-(void)titleClick:(UIButton *)sender
{
    self.navtitleClickBlock(sender);
}
// 改变按钮状态
-(void)changeSelectBtn:(UIButton *)btn
{
    self.previousBtn = self.currentBtn;
    self.currentBtn = btn;
    self.previousBtn.selected = NO;
    self.currentBtn.selected = YES;
}
// 更新按钮状态
-(void)updateSelecterToolsIndex:(NSInteger )index
{
    UIButton *selectBtn = self.btnArray[index];
    [self changeSelectBtn:selectBtn];
}

@end
