//
//  AdapterTableViewCell.h
//  AdapterTest
//
//  Created by Yong on 2016/12/12.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdapterProtocol.h"

@interface AdapterTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *adapterImage;

@property (strong, nonatomic) IBOutlet UILabel *adapterTitle;

- (void)reloadData:(id<AdapterProtocol>)data;




@end
