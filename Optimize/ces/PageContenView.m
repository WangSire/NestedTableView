//
//  SiriTableContenView.m
//  ces
//
//  Created by Siri on 2019/4/8.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "PageContenView.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#import "MJRefresh/MJRefresh.h"

@interface PageContenView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,copy)NSArray *titleArr;

@end

@implementation PageContenView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //[self setupUI];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArr = titles;
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    [self addSubview:[self createWithTitleView]];
    [self addSubview:self.tableView];
}

-(UIView *)createWithTitleView{
    UIScrollView *scrrolView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 60)];
    CGFloat btnWidth =  [UIScreen mainScreen].bounds.size.width / 3;
    for (int i = 0; i<self.titleArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(i*btnWidth, 0, btnWidth, scrrolView.bounds.size.height);
        button.backgroundColor = [UIColor lightGrayColor];
        [scrrolView addSubview:button];
    }
    return scrrolView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:@"cell"];
    }
    cell.detailTextLabel.text = @(indexPath.row).stringValue;
    return cell;
}

-(FirstTableView *)tableView{
    if (!_tableView) {
        _tableView = [[FirstTableView alloc]initWithFrame:CGRectMake(0, 60, kScreen_Width, self.frame.size.height - 60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.rowHeight = 80;
    }
    return _tableView;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    !self.tableViewDidScroll?:self.tableViewDidScroll(scrollView);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
