//
//  LDCustomCellModel.h
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDBaseCellModel.h"

/********************* 自定义cell model基类 *********************/

@interface LDCustomCellModel : LDBaseCellModel

/* 基类开放的属性(可用可不用，也可以自己定义熟悉 **/
@property (nonatomic, copy  ) NSString   *text;

/* 基类开放属性(可用可不用，也可以自己定义属性) **/
@property (nonatomic, copy  ) NSString   *detailText;

/**
 自定义模型初始化方法,请特别注意调用自定义模型方法后，cell必须自定义切存在

 @param cellIdentifier 自定义cell类名，作为唯一标示符
 @param block 回调block
 @return self
 */
- (instancetype)initWithCellIdentifier:(NSString *)cellIdentifier actionBlock:(LDBaseCellModelClickActionBlock)block;

@end
