//
//  TopView.m
//  PublicProtocolTest
//
//  Created by Siri on 2019/3/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "TopView.h"
#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kScreen_Height [UIScreen mainScreen].bounds.size.height

@interface TopView()
@property (strong, nonatomic) UIButton *leftBtn;
@property (strong, nonatomic) UIButton *rightBtn;
@end

@implementation TopView
- (void)setItemHeight:(CGFloat)itemHeight
{
    self.selectedItemIndex = 0;
    _itemHeight = itemHeight;
    self.backgroundColor = [UIColor yellowColor];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, self.frame.size.height - itemHeight, kScreen_Width /2, itemHeight);
    [leftBtn setTitle:@"FirstItem" forState:UIControlStateNormal];
//    leftBtn.enabled = NO;
    leftBtn.backgroundColor = [UIColor whiteColor];
    leftBtn.layer.borderWidth = 0.5;
    [leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    leftBtn.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
    [leftBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [leftBtn addTarget:self action:@selector(leftFirstClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    _leftBtn = leftBtn;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(kScreen_Width /2, self.frame.size.height - itemHeight, kScreen_Width /2, itemHeight);
    [rightBtn setTitle:@"SecondItem" forState:UIControlStateNormal];
//    rightBtn.enabled = NO;
    rightBtn.backgroundColor = [UIColor whiteColor];
    rightBtn.layer.borderWidth = 0.5;
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    rightBtn.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [self addSubview:rightBtn];
    _rightBtn = rightBtn;
    [rightBtn addTarget:self action:@selector(rightSecondClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.leftBtnFrame = leftBtn.frame;
    self.rightBtnFrame = rightBtn.frame;
}

-(void)leftFirstClick:(UIButton *)button{
    if (self.getSelectedItemIndex != 0) {
        self.selectedItemIndex = 0;
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        !self.btnSelect?:self.btnSelect(0);
    }
    
}
-(void)rightSecondClick:(UIButton *)button{
    if (self.getSelectedItemIndex != 1) {
        self.selectedItemIndex = 1;
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        !self.btnSelect?:self.btnSelect(1);
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
