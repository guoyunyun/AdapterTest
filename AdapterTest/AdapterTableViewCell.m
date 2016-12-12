//
//  AdapterTableViewCell.m
//  AdapterTest
//
//  Created by Yong on 2016/12/12.
//  Copyright © 2016年 Yong. All rights reserved.
//

#import "AdapterTableViewCell.h"

@implementation AdapterTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"AdapterTableViewCell" owner:self options:nil]lastObject];
    }
    return self;
}

- (void)reloadData:(id<AdapterProtocol>)data{

    self.adapterImage.image = [data headImage];
    self.adapterTitle.text = [data title];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
