//
//  LDTitleCellModel.h
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDBaseCellModel.h"

@interface LDTitleCellModel : LDBaseCellModel

/********************* 显示相关 *********************/

/* cell富文本标题(如果设置了这个，title属性将失效) **/
@property (nonatomic, copy) NSAttributedString *attributeTitle;

/* cell标题(默认左边) **/
@property (nonatomic, copy) NSString *title;

/* cell左边标题样式 **/
@property (nonatomic, assign) NSTextAlignment titileTextAlignment;

/* cell图片(左边) **/
@property (nonatomic, strong) UIImage *icon;

/* 是否显示右导航箭头(默认为YES) **/
@property (nonatomic, assign, getter=isShowArrow) BOOL showArrow;

/* cell标题color **/
@property (nonatomic, strong) UIColor *titleColor;

/* cell标题font **/
@property (nonatomic, strong) UIFont *titleFont;

/* 箭头image **/
@property (nonatomic, strong)UIImage *arrowImage;

/* 箭头宽度 **/
@property (nonatomic, assign)CGFloat arrowWidth;

/* 箭头高度 **/
@property (nonatomic, assign)CGFloat arrowHeight;


/********************* 其它偏移属性 *********************/

/* 子类控件(比如，文本，开关，图片)cellModel距右边屏幕的间距默认15,如果有箭头，则就是箭头到右屏幕的间距，配合arrowControlRightOffset 使用 **/
@property (nonatomic, assign)CGFloat controlRightOffset;

/* 子类控件(比如，文本，开关，图片)距右边箭头间距默认15/2 = 7.5，(如果箭头隐藏，此属性则无效) **/
@property (nonatomic, assign)CGFloat arrowControlRightOffset;

/**
 model初始化方法
 
 @param title 模型标题
 @param block block类型
 @return LDBaseCellModel
 */
- (instancetype)initWithTitle:(NSString *)title actionBlock:(LDBaseCellModelClickActionBlock)block;


/**
 model初始化方法
 
 @param attributeTitle 模型富文本标题
 @param block block回调
 @return LDBaseCellModel
 */
- (instancetype)initWithAttributeTitle:(NSAttributedString *)attributeTitle actionBlock:(LDBaseCellModelClickActionBlock)block;



@end
