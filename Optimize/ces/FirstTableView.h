//
//  FirstTableView.h
//  PublicProtocolTest
//
//  Created by Siri on 2019/3/7.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstTableView : UITableView<UIGestureRecognizerDelegate>
@property (nonatomic ,copy)void(^tableViewDidScroll)(UIScrollView *tableView);
@end
