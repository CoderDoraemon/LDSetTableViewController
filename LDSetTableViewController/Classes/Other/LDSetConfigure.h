//
//  LDSetConfigure.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#ifndef __LDSetConfigure__H__
#define __LDSetConfigure__H__

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+LDExtension.h"

//标题左边的默认cell间距
#define LD_KCellMargin 15.0
//cell分割线默认高度
#define LD_KSeparateHeight .5
//cell分割线默认颜色
#define LD_KSeparateColor [UIColor ld_colorWithHexString:@"#e6e6e6"]
//标题默认字体大小
#define LD_KTitleFont  [UIFont systemFontOfSize:15.0]
//标题默认字体颜色
#define LD_KTitleColor  [UIColor blackColor]
//详细文本默认字体大小
#define LD_KDetailFont [UIFont systemFontOfSize:13.0]
//标题默详细文本字体颜色
#define LD_KDetailColor  [UIColor grayColor]
//分组section之间的距离
#define LD_SectionHeight  10

//箭头默认宽度
#define LD_KArrowWidth 8
//箭头默认高度
#define LD_kArrowHeight 13
//右边文本离左边的边距
#define LD_KCellTextLeftPading  150
//距离cell上下默认边距pading
#define LD_KCellPading  5
//cell默认高度
#define LD_KCellHeight 44
//开关默认宽度
#define LD_KSwitchWidth 50
//开关默认高度
#define LD_KSwitchHeight 30
//大图默认cell高度
#define LD_KImageCellHeight 90
//右边大图默认宽度
#define LD_KImageWidth  60
//右边大图默认高度
#define LD_KImageHeight 60
//屏幕宏定义
#define LD_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define LD_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//Log打印
#ifdef DEBUG
# define LDLog(fmt, ...) NSLog((@"行: %d >  " fmt), __LINE__, ##__VA_ARGS__);
#else
# define LDLog(...);
#endif


UIKIT_EXTERN NSString *const LDBaseCellModelCellClass;
UIKIT_EXTERN NSString *const LDTitleCellModelCellClass;
UIKIT_EXTERN NSString *const LDImageCellModelCellClass;
UIKIT_EXTERN NSString *const LDSwitchCellModelCellClass;
UIKIT_EXTERN NSString *const LDTextCellModelCellClass;

#endif /* LDSetConfigure */
