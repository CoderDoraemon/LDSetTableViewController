//
//  NSString+LDHeight.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LDHeight)

/**
 计算文本高度方法
 
 @param font 字体大小
 @param width 宽度
 @return 文字高度
 */
- (CGFloat)ld_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

@end
