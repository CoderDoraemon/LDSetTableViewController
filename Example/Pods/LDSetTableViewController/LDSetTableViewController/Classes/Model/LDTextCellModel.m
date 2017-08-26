//
//  LDTextRightModel.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDTextCellModel.h"
#import <CoreText/CoreText.h>

@interface LDTextCellModel()

/* 一行文本的高度 **/
@property (nonatomic, assign) CGFloat heightOne;

/* 多行文本高度 **/
@property (nonatomic, assign) CGFloat heightMore;

@end

@implementation LDTextCellModel

- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super initWithTitle:title actionBlock:block]) {
        self.leftPading = LD_KCellTextLeftPading;
        self.detailFont = LD_KDetailFont;
        self.detailColor = LD_KDetailColor;
        self.detailText = detailText;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title attributrDetailText:(NSAttributedString *)attributrDetailText actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super initWithTitle:title actionBlock:block]) {
        self.leftPading = LD_KCellTextLeftPading;
        self.detailFont = LD_KDetailFont;
        self.detailColor = LD_KDetailColor;
        self.attributeDetailText = attributrDetailText;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailAttributeText:(NSAttributedString *)attributeDetailText actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super initWithAttributeTitle:attributeTitle actionBlock:block]) {
        self.leftPading = LD_KCellTextLeftPading;
        self.attributeDetailText = attributeDetailText;
    }
    return self;
}

- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailText:(NSString *)detailText actionBlock:(LDBaseCellModelClickActionBlock)block {
    
    if (self = [super initWithAttributeTitle:attributeTitle actionBlock:block]) {
        self.leftPading = LD_KCellTextLeftPading;
        self.detailFont = LD_KDetailFont;
        self.detailColor = LD_KDetailColor;
        self.detailText = detailText;
    }
    return self;
}

- (NSString *)cellClass {
    
    return LDTextCellModelCellClass;
}

- (void)setShowArrow:(BOOL)showArrow {
    
    [super setShowArrow:showArrow];
    [self setDetailText:self.detailText];
}

- (void)setDetailFont:(UIFont *)detailFont {
    
    _detailFont = detailFont;
    [self setDetailText:self.detailText];
}

- (void)setArrowControlRightOffset:(CGFloat)arrowControlRightOffset {
    
    [super setArrowControlRightOffset:arrowControlRightOffset];
    [self setDetailText:self.detailText];
}

- (void)setControlRightOffset:(CGFloat)controlRightOffset {
    
    [super setControlRightOffset:controlRightOffset];
    [self setDetailText:self.detailText];
}

- (void)setLeftPading:(CGFloat)leftPading {
    
    _leftPading = leftPading;
    [self setDetailText:self.detailText];
}

- (void)setDetailText:(NSString *)detailText {
    
    //如果detailText为nil 直接返回，为空不能返回
    if(detailText == nil){
        return;
    }
    _detailText = detailText;
    if(self.attributeDetailText) {
        //如果外部设置过富文本，则忽略纯文本计算
        return;
    }
    [self heightSizeWithTextObject:detailText];
   
}

- (void)setAttributeDetailText:(NSAttributedString *)attributeDetailText
{
    if(attributeDetailText == nil) {
        return;
    }
    _attributeDetailText = attributeDetailText;
    [self heightSizeWithTextObject:attributeDetailText];
    
}

- (void)heightSizeWithTextObject:(id)object {
    
    //初始化文本高度  外部不可任意改变不然界面看起来很奇怪
    self.cellHeight = 0.0f;
    UIDeviceOrientation duration = [[UIDevice currentDevice]orientation];
    CGFloat screenWidth = 0;
    if(duration == UIDeviceOrientationLandscapeLeft || duration == UIDeviceOrientationLandscapeRight){
        screenWidth = LD_SCREEN_HEIGHT > LD_SCREEN_WIDTH ? LD_SCREEN_HEIGHT:LD_SCREEN_WIDTH;
    }else{
        screenWidth = LD_SCREEN_HEIGHT < LD_SCREEN_WIDTH ? LD_SCREEN_HEIGHT:LD_SCREEN_WIDTH;
    }
    CGFloat height = 0;
    UIFont *font;
    if([object isKindOfClass:[NSString class]]){
       height = [(NSString *)object ld_heightWithFont:self.detailFont constrainedToWidth:screenWidth - self.leftPading - (self.showArrow ?  self.controlRightOffset + self.arrowControlRightOffset + self.arrowWidth : self.controlRightOffset)];
        font = self.detailFont;
        
    }else{
        
    }
    
    if(height < font.pointSize + 5 || height == 0){
        //说明只有一行
        self.heightOne = height;
        self.heightMore = .0f;
        self.cellHeight = LD_KCellHeight;
    }else{
        self.heightMore = height;
        self.heightOne = .0f;
        //cell足够大
        self.cellHeight = height + 2 * LD_KCellPading;
    }
}


@end
