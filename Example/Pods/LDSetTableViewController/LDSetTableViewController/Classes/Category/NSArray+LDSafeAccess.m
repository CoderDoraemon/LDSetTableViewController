//
//  NSArray+LDSafeAccess.m
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "NSArray+LDSafeAccess.h"

@implementation NSArray (LDSafeAccess)

- (instancetype)ld_objectWithIndex:(NSUInteger)index
{
    if (index < self.count) {
        return self[index];
    }else{
        return nil;
    }
}

@end
