//
//  LDSwitchCellModel.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDSwitchCellModel.h"
#import "LDSwitchTableViewCell.h"

@implementation LDSwitchCellModel

- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(switchBlock)block
{
    if (self = [super initWithTitle:title actionBlock:nil]) {
        self.switchBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.showArrow = NO;
        self.on = on;
    }
    return self;
}

- (NSString *)cellClass {
    return NSStringFromClass(LDSwitchTableViewCell.class);
}
@end
