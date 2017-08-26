//
//  LDSwitchCellModel.h
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDBaseCellModel.h"
#import "LDTitleCellModel.h"

@class LDBaseCellModel;

typedef void(^switchBlock)(LDBaseCellModel *model,BOOL on);

@interface LDSwitchCellModel : LDTitleCellModel

/* 开关状态 **/
@property (nonatomic, assign, getter=isOn) BOOL on;

/* 开关tint颜色 **/
@property (nonatomic, strong)UIColor *onTintColor;

/* block调用 **/
@property (nonatomic, copy)switchBlock switchBlock;



/**
 开关cell初始化方法

 @param title 开关cell标题
 @param on 开关状态
 @param block block
 @return LDSwitchCellModel
 */
- (instancetype)initWithTitle:(NSString *)title switchType:(BOOL)on switchBlock:(switchBlock)block;

@end
