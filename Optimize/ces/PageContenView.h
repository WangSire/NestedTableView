//
//  SiriTableContenView.h
//  ces
//
//  Created by Siri on 2019/4/8.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableView.h"

NS_ASSUME_NONNULL_BEGIN

@interface PageContenView : UIView
-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray *)titles;
@property (nonatomic ,copy)void(^tableViewDidScroll)(UIScrollView *tableView);
@property (nonatomic ,strong)FirstTableView *tableView;

@end

NS_ASSUME_NONNULL_END
