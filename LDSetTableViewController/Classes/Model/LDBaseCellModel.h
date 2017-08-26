//
//  LDBaseCellModel.h
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LDSetHeader.h"

@class LDBaseCellModel;

typedef void(^LDBaseCellModelClickActionBlock)(LDBaseCellModel *model);

@interface LDBaseCellModel : NSObject

/********************* 基础属性 *********************/

/* 唯一标识符(更新会用到) **/
@property (nonatomic, copy,readonly) NSString *identifier;

/* 该模型绑定的cell类名 **/
@property (nonatomic, copy,readonly) NSString *cellClass;

/* 选中cell效果 **/
@property (nonatomic, assign) UITableViewCellSelectionStyle selectionStyle;

/* cell高度(默认有高度) **/
@property (nonatomic, assign) CGFloat cellHeight;

/* 分割线高度 **/
@property (nonatomic, assign) CGFloat separateHeight;

/* 分割线颜色 **/
@property (nonatomic, strong) UIColor *separateColor;

/* 分割线左边间距(默认为0) **/
@property (nonatomic, assign) CGFloat separateOffset;

/* cell点击事件 **/
@property (nonatomic,  copy) LDBaseCellModelClickActionBlock actionBlock;



@end
