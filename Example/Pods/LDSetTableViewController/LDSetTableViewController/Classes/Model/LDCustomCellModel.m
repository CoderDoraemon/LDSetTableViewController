//
//  LDCustomCellModel.m
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDCustomCellModel.h"
#import "LDSetTableViewController.h"

@interface LDCustomCellModel()
{
    NSString *privateCellClass;///<私有变量
}

@end
@implementation LDCustomCellModel


- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super init]) {
        self.cellHeight = LD_KCellHeight;
        self.actionBlock = block;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.separateOffset = LD_KCellMargin;
        self.separateColor = LD_KSeparateColor;
        self.separateHeight = LD_KSeparateHeight;
        //cellClass 为与cell类名绑定的自定义cell类名必须一致，类名作为identifier的重用标示符号,如果不一致将报错。
        privateCellClass = cellIdentifier;
    }
    return self;
}


- (NSString *)cellClass
{
    return privateCellClass;
}

@end
