//
//  PublicProtocol.h
//  PublicProtocolTest
//
//  Created by Siri on 2019/2/19.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PublicProtocol <NSObject>
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,assign)NSInteger age;
@property (nonatomic ,copy)void(^backName)(void);
-(NSString *)showWithName;
-(void)wuahahWith:(void(^)(NSString *str))strBlock;
@end
