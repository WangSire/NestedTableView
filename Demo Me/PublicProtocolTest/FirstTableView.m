//
//  FirstTableView.m
//  PublicProtocolTest
//
//  Created by Siri on 2019/3/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "FirstTableView.h"
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#import "UIView+Extension.h"

@interface FirstTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FirstTableView



-(void)setTopViwe:(TopView *)topViwe{
    _topViwe = topViwe;
    self.delegate = self;
    self.dataSource = self;
//    滚动条的位置
    self.scrollIndicatorInsets = UIEdgeInsetsMake(_topViwe.height, 0, 0, 0);
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, _topViwe.height)];
    self.tableHeaderView = tableHeaderView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseFirstTableViewCell = @"reuseFirstTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseFirstTableViewCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseFirstTableViewCell];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.textColor = [UIColor orangeColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"FirstTableView:第%ld行", (long)indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"firstTable -- %ld",(long)indexPath.row);
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    当scrollView滚动时,修改topview坐标
    CGFloat placeHolderHeight = self.topViwe.height - self.topViwe.itemHeight;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0 && offsetY <= placeHolderHeight) {
        self.topViwe.y = -offsetY;
    }else if (offsetY > placeHolderHeight){
        self.topViwe.y = - placeHolderHeight;
    }else if (offsetY < 0){
        self.topViwe.y = -offsetY;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
