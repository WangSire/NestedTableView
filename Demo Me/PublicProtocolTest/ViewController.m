//
//  ViewController.m
//  PublicProtocolTest
//
//  Created by Siri on 2019/2/19.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "ViewController.h"
#import "PeopleModel.h"
#import "TopView.h"
#import "FirstTableView.h"
#import "SecondTableView.h"
#import "UIView+Extension.h"
#import "Masonry.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic ,strong)TopView *topView;
@property (nonatomic ,strong)UIView *bgView;
@property (nonatomic ,strong)FirstTableView *firstTable;
@property (nonatomic ,strong)SecondTableView *secondTable;
@property (nonatomic ,strong)UIScrollView *bottomScrollView;

@end

@implementation ViewController


-(void)loadView{
    [super loadView];
    self.view = self.bgView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.bottomScrollView];
    [self.view addSubview:self.topView];
    [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.frame = [UIScreen mainScreen].bounds;
        _bgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bgView;
}
-(TopView *)topView{
    if (!_topView) {
        _topView = [[TopView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, 200)];
        _topView.itemHeight = 50;
        __weak typeof(self) weakSelf = self;
        _topView.btnSelect = ^(NSInteger index) {
            if (index == 0) {
                [weakSelf.bottomScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
            }else{
                [weakSelf.bottomScrollView setContentOffset:CGPointMake(kScreen_Width, 0)  animated:NO];
            }
        };
    }
    return _topView;
}
-(UIScrollView *)bottomScrollView{
    if (!_bottomScrollView) {
        _bottomScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _bottomScrollView.showsVerticalScrollIndicator = NO;
        _bottomScrollView.showsHorizontalScrollIndicator = NO;
        _bottomScrollView.backgroundColor = [UIColor lightGrayColor];
        _bottomScrollView.pagingEnabled = YES;
        _bottomScrollView.scrollEnabled = NO;
        _bottomScrollView.delegate = self;
        _bottomScrollView.contentSize = CGSizeMake(kScreen_Width * 2, kScreen_Height);
        [_bottomScrollView addSubview:self.firstTable];
        [_bottomScrollView addSubview:self.secondTable];
    }
    return _bottomScrollView;
}

-(FirstTableView *)firstTable{
    if (!_firstTable) {
        _firstTable = [[FirstTableView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
        _firstTable.backgroundColor = [UIColor redColor];
        _firstTable.topViwe = self.topView;
    }
    return _firstTable;
}
-(SecondTableView *)secondTable{
    if (!_secondTable) {
        _secondTable = [[SecondTableView alloc]initWithFrame:CGRectMake(kScreen_Width, 0, kScreen_Width, kScreen_Height)];
        _secondTable.topView = self.topView;
    }
    return _secondTable;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    两个列表切换时,更新topView最新的位置
    CGFloat itemHeight = self.topView.height - self.topView.itemHeight;
    if (self.topView.getSelectedItemIndex == 1) {
        if (self.firstTable.contentOffset.y >= itemHeight) {
            [self.secondTable setContentOffset:CGPointMake(0, itemHeight) animated:NO];
        }else{
            [self.secondTable setContentOffset:CGPointMake(0, self.firstTable.contentOffset.y) animated:NO];
        }
    }else{
        if (self.secondTable.contentOffset.y >= itemHeight) {
            [self.firstTable setContentOffset:CGPointMake(0, itemHeight) animated:NO];
        }else{
            [self.firstTable setContentOffset:CGPointMake(0, self.secondTable.contentOffset.y) animated:NO];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
