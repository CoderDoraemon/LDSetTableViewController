//
//  UIColor+LDExtension.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LDExtension)

//color颜色分类方法
+ (instancetype)ld_colorWithHexString:(NSString *)hexString;

//ld_color颜色分类方法
+ (instancetype)ld_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
