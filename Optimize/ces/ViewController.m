//
//  ViewController.m
//  ces
//
//  Created by Siri on 2019/4/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "ViewController.h"
#import "FirstTableView.h"
#import "ContenView.h"

@interface ViewController ()
@property (nonatomic ,strong) UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    [UITableView appearance].estimatedRowHeight = 0;
    [UITableView appearance].estimatedSectionHeaderHeight = 0;
    [UITableView appearance].estimatedSectionFooterHeight = 0;
    
    
    ContenView *view = [[ContenView alloc]initWithFrame:self.view.bounds];
    view.isMidRefresh = YES;
    [self.view addSubview:view];
}




@end
