//
//  UIView+LDFrame.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LDFrame)

@property (nonatomic, assign) CGFloat ld_x;
@property (nonatomic, assign) CGFloat ld_y;
@property (nonatomic, assign) CGFloat ld_centerX;
@property (nonatomic, assign) CGFloat ld_centerY;
@property (nonatomic, assign) CGFloat ld_width;
@property (nonatomic, assign) CGFloat ld_height;
@property (nonatomic, assign) CGSize  ld_size;

@end


@interface CALayer (LDFrame)

@property (nonatomic, assign) CGFloat ld_x;
@property (nonatomic, assign) CGFloat ld_y;
@property (nonatomic, assign) CGFloat ld_width;
@property (nonatomic, assign) CGFloat ld_height;
@property (nonatomic, assign) CGSize  ld_size;

@end
