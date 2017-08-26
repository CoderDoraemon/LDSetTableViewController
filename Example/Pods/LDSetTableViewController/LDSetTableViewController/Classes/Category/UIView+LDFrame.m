//
//  UIView+LDFrame.m
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "UIView+LDFrame.h"

@implementation UIView (LDFrame)

- (void)setLd_x:(CGFloat)ld_x {
    CGRect frame = self.frame;
    frame.origin.x = ld_x;
    self.frame = frame;
}

- (CGFloat)ld_x {
    return self.frame.origin.x;
}

- (void)setLd_centerX:(CGFloat)ld_centerX {
    CGPoint center = self.center;
    center.x = ld_centerX;
    self.center = center;
}

- (CGFloat)ld_centerX {
    return self.center.x;
}

- (void)setLd_centerY:(CGFloat)ld_centerY {
    CGPoint center = self.center;
    center.y = ld_centerY;
    self.center = center;
}

- (CGFloat)ld_centerY {
    return self.center.y;
}

- (void)setLd_y:(CGFloat)ld_y {
    CGRect frame = self.frame;
    frame.origin.y = ld_y;
    self.frame = frame;
}

- (CGFloat)ld_y {
    return self.frame.origin.y;
}

- (void)setLd_size:(CGSize)ld_size {
    CGRect frame = self.frame;
    frame.size = ld_size;
    self.frame = frame;
    
}

- (CGSize)ld_size {
    return self.frame.size;
}

- (void)setLd_height:(CGFloat)ld_height {
    CGRect frame = self.frame;
    frame.size.height = ld_height;
    self.frame = frame;
}

- (CGFloat)ld_height {
    return self.frame.size.height;
}

- (void)setLd_width:(CGFloat)ld_width {
    CGRect frame = self.frame;
    frame.size.width = ld_width;
    self.frame = frame;
    
}

-(CGFloat)ld_width {
    return self.frame.size.width;
}

- (void)setLd_origin:(CGPoint)ld_origin {
    CGRect frame = self.frame;
    frame.origin = ld_origin;
    self.frame = frame;
}

- (CGPoint)ld_origin {
    return self.frame.origin;
}

@end

@implementation CALayer(HSFrame)

- (void)setLd_x:(CGFloat)ld_x {
    CGRect frame = self.frame;
    frame.origin.x = ld_x;
    self.frame = frame;
}

- (CGFloat)ld_x {
    return self.frame.origin.x;
}

- (void)setLd_y:(CGFloat)ld_y {
    CGRect frame = self.frame;
    frame.origin.y = ld_y;
    self.frame = frame;
}

- (CGFloat)ld_y {
    return self.frame.origin.y;
}

- (void)setLd_size:(CGSize)ld_size {
    CGRect frame = self.frame;
    frame.size = ld_size;
    self.frame = frame;
    
}

- (CGSize)ld_size {
    return self.frame.size;
}

- (void)setLd_height:(CGFloat)ld_height {
    CGRect frame = self.frame;
    frame.size.height = ld_height;
    self.frame = frame;
}

- (CGFloat)ld_height {
    return self.frame.size.height;
}

- (void)setLd_width:(CGFloat)ld_width {
    CGRect frame = self.frame;
    frame.size.width = ld_width;
    self.frame = frame;
    
}

- (CGFloat)ld_width {
    return self.frame.size.width;
}


@end
