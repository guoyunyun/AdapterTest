//
//  AnimalAdapter.m
//  AdapterTest
//
//  Created by Yong on 2016/12/7.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "AnimalAdapter.h"
#import "AnimalModel.h"

@implementation AnimalAdapter

- (instancetype)initWithData:(id)data{

    self = [super init];

    if (self) {
        self.data = data;
    }
    return self;
}

- (NSString *)title{

    AnimalModel *model = self.data;
    return model.animalType;
}

- (UIImage *)headImage{

    AnimalModel *model = self.data;
    UIImage *image = [UIImage imageNamed:model.animalImage];
    return image;
}


@end
