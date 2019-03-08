//
//  TopView.h
//  PublicProtocolTest
//
//  Created by Siri on 2019/3/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopView : UIView
@property (assign, nonatomic) CGFloat itemHeight;
@property (assign, nonatomic, getter=getSelectedItemIndex) NSInteger selectedItemIndex;

@property (assign, nonatomic) CGRect leftBtnFrame;
@property (assign, nonatomic) CGRect rightBtnFrame;
@property (nonatomic ,copy)void(^btnSelect)(NSInteger index);
@end
