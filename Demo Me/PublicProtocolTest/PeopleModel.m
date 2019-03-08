//
//  PeopleModel.m
//  PublicProtocolTest
//
//  Created by Siri on 2019/2/19.
//  Copyright © 2019年 Siri. All rights reserved.
//

#import "PeopleModel.h"

@interface PeopleModel ()
//@property (nonatomic ,copy)NSString *name;
//@property (nonatomic ,assign)NSInteger age;



@end

@implementation PeopleModel
@synthesize age;
@synthesize name;
@synthesize backName;


-(instancetype)init{
    self = [super init];
    if (self) {
        [self performSelector:@selector(diaoyong) withObject:self afterDelay:4];
    }
    return self;
}

-(void)diaoyong{
    !self.backName?:self.backName();
}

-(NSString *)showWithName{
    return self.name;
}
-(void)wuahahWith:(void (^)(NSString *))strBlock{
    strBlock(@"123");
}


@end
