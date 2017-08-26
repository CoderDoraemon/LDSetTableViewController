//
//  LDBigImageCellModel.h
//  LDSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "LDTitleCellModel.h"

typedef void(^LDImageCellModelClickImageBlock)(LDBaseCellModel *cellModel);

//右边大图model
@interface LDImageCellModel : LDTitleCellModel

/* 初始化图片 **/
@property (nonatomic, strong) UIImage *placeHoderImage;

/* 显示图片url片 **/
@property (nonatomic, copy) NSString *imageUrl;

/* 初图片icon **/
@property (nonatomic, strong) UIImage *imageIcon;

/* 图片大小 **/
@property (nonatomic, assign) CGSize imageSize;

/* 图片圆角 **/
@property (nonatomic, assign) CGFloat cornerRadius;

/* 点击图片block **/
@property (nonatomic, copy)LDImageCellModelClickImageBlock imageBlock;


/**
 图片模型初始化方法

 @param title cell标题
 @param placeholderImage 初始化image
 @param imageUrl 右边大图image
 @param actionblock cell点击block
 @param imageBlock 右边大图点击block
 @return LDImageCellModel
 */
- (instancetype)initWithTitle:(NSString *)title placeholderImage:(UIImage *)placeholderImage imageUrl:(NSString *)imageUrl actionBlock:(LDBaseCellModelClickActionBlock)actionblock imageBlock:(LDImageCellModelClickImageBlock)imageBlock;

@end
