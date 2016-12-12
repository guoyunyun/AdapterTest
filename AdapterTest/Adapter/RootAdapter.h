//
//  RootAdapter.h
//  AdapterTest
//
//  Created by Yong on 2016/12/7.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdapterProtocol.h"

@interface RootAdapter : NSObject<AdapterProtocol>

@property (weak, nonatomic) id data;


- (instancetype)initWithData:(id)data;


@end
