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

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return kSpace;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.actArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JMActivityTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JMActivityTBCell" forIndexPath:indexPath];
    
    if (self.actArr.count > indexPath.section) {
        cell.actModel = self.actArr[indexPath.section];
    }
    
    return cell;
}



@end
