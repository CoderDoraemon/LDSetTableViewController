//
//  LDTitleCellModel.m
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDTitleCellModel.h"
#import "LDTitleTableViewCell.h"

@implementation LDTitleCellModel

- (instancetype)initWithTitle:(NSString *)title actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super init]) {
        self.title = title;
        self.actionBlock = block;
        [self setup];
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super init]) {
        self.attributeTitle = attributeTitle;
        self.actionBlock = block;
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.cellHeight = LD_KCellHeight;
    self.showArrow = YES;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    self.separateColor = LD_KSeparateColor;
    self.separateHeight = LD_KSeparateHeight;
    self.separateOffset = LD_KCellMargin;
    self.titleFont = LD_KTitleFont;
    self.titleColor = LD_KTitleColor;
    self.arrowImage = [UIImage imageNamed:@"ld_arrow_icon"];
    self.arrowWidth = LD_KArrowWidth;
    self.arrowHeight = LD_kArrowHeight;
    self.controlRightOffset = LD_KCellMargin;
    self.arrowControlRightOffset = LD_KCellMargin/2;
    self.titileTextAlignment = NSTextAlignmentLeft;
}

- (NSString *)cellClass {
    return NSStringFromClass(LDTitleTableViewCell.class);
}
@end
