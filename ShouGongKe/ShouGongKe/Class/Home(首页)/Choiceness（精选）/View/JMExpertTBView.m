//
//  JMExpertTBView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMExpertTBView.h"
#import "JMExpertTBCell.h"
@interface JMExpertTBView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation JMExpertTBView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView{
    self.delegate = self;
    self.dataSource = self;
    self.backgroundColor = kColorWhite;
    CGFloat imgWidth = SCREEN_WIDTH/3.0;
    self.rowHeight = imgWidth + 60;
    
    [self registerClass:[JMExpertTBCell class] forCellReuseIdentifier:@"JMExpertTBCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JMExpertTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JMExpertTBCell" forIndexPath:indexPath];
    
    
    
    return cell;
}

@end
