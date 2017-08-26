//
//  NSArray+LDSafeAccess.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LDSafeAccess)

/**
 按照索引安全返回数组元素
 
 @param index 索引index
 @return self
 */
- (instancetype)ld_objectWithIndex:(NSUInteger)index;

@end
