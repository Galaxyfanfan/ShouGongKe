//
//  JMActivityTBView.m
//  ShouGongKe
//
//  Created by Galaxy on 16/9/29.
//  Copyright © 2016年 Galaxy. All rights reserved.
//

#import "JMActivityTBView.h"
#import "JMActivityTBCell.h"
@interface JMActivityTBView()<UITableViewDelegate,UITableViewDataSource>

@end
@implementation JMActivityTBView


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
    self.rowHeight = 200;
    
    [self registerClass:[JMActivityTBCell class] forCellReuseIdentifier:@"JMActivityTBCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JMActivityTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JMActivityTBCell" forIndexPath:indexPath];
    
    
    
    return cell;
}



@end
