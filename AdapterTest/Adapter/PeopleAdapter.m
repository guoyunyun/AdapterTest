//
//  PeopleAdapter.m
//  AdapterTest
//
//  Created by Yong on 2016/12/7.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "PeopleAdapter.h"
#import "PeopleModel.h"

@implementation PeopleAdapter

- (instancetype)initWithData:(id)data{

    self = [super init];

    if (self) {
        self.data = data;
    }

    return self;
}

- (NSString *)title{

    PeopleModel *model = self.data;
    return model.name;
}


- (UIImage *)headImage{

    PeopleModel *model = self.data;
    UIImage *image = [UIImage imageNamed:model.icon];
    return image;
}


@end
