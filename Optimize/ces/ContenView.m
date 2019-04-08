//
//  ContenView.m
//  ces
//
//  Created by Siri on 2019/4/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "ContenView.h"
#import "PageContenView.h"
#import "MJRefresh/MJRefresh.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define HeadHeight 150.0
@interface ContenView()<UIScrollViewDelegate>
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,assign)BOOL isSuspension;//head是否到达顶部
@property (nonatomic ,strong)PageContenView *pageView;
@end

@implementation ContenView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setIsMidRefresh:(BOOL)isMidRefresh{
    _isMidRefresh = isMidRefresh;
    if (!isMidRefresh) {
        self.scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            sleep(2);
            [self.scrollView.mj_header endRefreshing];
        }];
    }else{
        self.pageView.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            sleep(2);
            [self.pageView.tableView.mj_header endRefreshing];
        }];
    }
    self.pageView.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        sleep(2);
        [self.pageView.tableView.mj_footer endRefreshing];
    }];
}

-(void)setupUI{
    
    self.scrollView  = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
    self.scrollView.contentSize = CGSizeMake(kScreen_Width, kScreen_Height + HeadHeight);
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, HeadHeight)];
    headView.backgroundColor = [UIColor redColor];
    [self.scrollView addSubview:headView];
    
    UIScrollView *subScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HeadHeight, kScreen_Width, kScreen_Height)];
    [self.scrollView addSubview:subScrollView];
    

    self.pageView = [[PageContenView alloc]initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height) Titles:@[@"我的",@"发现",@"首页"]];
    __weak typeof(self) weakSelf = self;
    self.pageView.tableViewDidScroll = ^(UIScrollView * _Nonnull tableView) {
        [weakSelf tableViewDidScroll:tableView];
    };
    [subScrollView addSubview:self.pageView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollView");
//    if (self.isMidRefresh) {
//        if (!self.isSuspension) {
//            if (scrollView.contentOffset.y >= HeadHeight) {
//                scrollView.contentOffset = CGPointMake(0, HeadHeight);
//                self.isSuspension = YES;
//            }else if (scrollView.contentOffset.y < 0){
//                self.scrollView.contentOffset = CGPointZero;
//            }
//        }else{
//
//            scrollView.contentOffset = CGPointMake(0, HeadHeight);
//        }
//    }else{
//        if (!self.isSuspension) {
//            if (scrollView.contentOffset.y >= HeadHeight) {
//                scrollView.contentOffset = CGPointMake(0, HeadHeight);
//                self.isSuspension = YES;
//            }
//        }else{
//            scrollView.contentOffset = CGPointMake(0, HeadHeight);
//        }
//    }
    
    if (scrollView == self.scrollView) {
        //设置headView的位置
        if (scrollView.contentOffset.y >= HeadHeight) {
            scrollView.contentOffset = CGPointMake(0, HeadHeight);
            self.isSuspension = YES;
        }else{
            if (self.isSuspension) {
                scrollView.contentOffset = CGPointMake(0, HeadHeight);
            }
        }
        
        if (self.isMidRefresh && self.pageView.tableView.contentOffset.y<=0 && scrollView.contentOffset.y <=0) {
            scrollView.contentOffset = CGPointZero;
        }else{
            if (scrollView.contentOffset.y < HeadHeight) {
                if (!self.isSuspension) {
                    self.pageView.tableView.contentOffset = CGPointZero;
                }
            }
        }
    }

}
-(void)tableViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"tableView");
    
    /*
    if (self.isMidRefresh) {
        if (!self.isSuspension && scrollView.contentOffset.y < 0 && self.scrollView.contentOffset.y <=0) {
                self.scrollView.contentOffset = CGPointZero;
        }else{
            if (!self.isSuspension) {
                scrollView.contentOffset = CGPointZero;
            }else{
                // head进入悬浮
                if (scrollView.contentOffset.y < 0) {
                    self.isSuspension = NO;
                    scrollView.contentOffset = CGPointZero;
                }else{
                    self.isSuspension = YES;
                }
            }
        }
    }else{
        if (!self.isSuspension) {
                scrollView.contentOffset = CGPointZero;
        }else{
                // head进入悬浮
            if (scrollView.contentOffset.y < 0) {
                self.isSuspension = NO;
                scrollView.contentOffset = CGPointZero;
            }else{
                self.isSuspension = YES;
            }
        }
    }
     */
    
    if (self.isMidRefresh && scrollView.contentOffset.y <0 && !self.isSuspension  && self.scrollView.contentOffset.y<=0) {
        self.scrollView.contentOffset = CGPointZero;
    }else{
        if (!self.isSuspension) {
            scrollView.contentOffset = CGPointZero;
        }
        if (scrollView.contentOffset.y <=0) {
            self.isSuspension = NO;
            scrollView.contentOffset = CGPointZero;
        }else{
            self.isSuspension = YES;
        }
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
