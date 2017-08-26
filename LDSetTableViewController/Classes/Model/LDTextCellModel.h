//
//  LDTextRightModel.h
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDTitleCellModel.h"


@interface LDTextCellModel : LDTitleCellModel

/* 开关状态 **/
@property (nonatomic, copy)   NSString *detailText;

/* 设置富文本内容后detailText将失效 **/
@property (nonatomic, copy)   NSAttributedString *attributeDetailText;

/* cell详细文本color **/
@property (nonatomic, strong) UIColor *detailColor;

/* cell详细文本Font **/
@property (nonatomic, strong) UIFont *detailFont;

/* 距离左边的间距 **/
@property (nonatomic, assign) CGFloat leftPading;


/**
 文本初始model化方法

 @param title 标题
 @param detailText 详细文本
 @param block 回调
 @return LDTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title detailText:(NSString *)detailText actionBlock:(LDBaseCellModelClickActionBlock)block;


/**
 文本Model初始化方法

 @param title 标题文本
 @param attributrDetailText 详细富文本
 @param block 回调
 @return LDTextCellModel
 */
- (instancetype)initWithTitle:(NSString *)title attributrDetailText:(NSAttributedString *)attributrDetailText actionBlock:(LDBaseCellModelClickActionBlock)block;


/**
 文本model初始化方法

 @param attributeTitle 标题
 @param attributeDetailText 详细富文本
 @param block block
 @return LDTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailAttributeText:(NSAttributedString *)attributeDetailText actionBlock:(LDBaseCellModelClickActionBlock)block;




/**
 文本model初始化方法

 @param attributeTitle 富文本标题
 @param detailText 详细文本
 @param block 回调
 @return LDTextCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle detailText:(NSString *)detailText actionBlock:(LDBaseCellModelClickActionBlock)block;

@end
