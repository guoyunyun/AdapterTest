//
//  RootAdapter.m
//  AdapterTest
//
//  Created by Yong on 2016/12/7.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "RootAdapter.h"

@implementation RootAdapter

- (instancetype)initWithData:(id)data{

    self = [super init];

    if (self) {
        self.data = data;
    }
    
    return self;
}

- (NSString *)title{

    return nil;
}


- (UIImage *)headImage{

    return nil;
}




@end
