//
//  LDBaseCellModel.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDBaseCellModel.h"

@interface LDBaseCellModel() {
    /* 私有变量 **/
    NSString *privateCellModelIdentifier;
}

@end

@implementation LDBaseCellModel


- (instancetype)init {
    
    if (self = [super init]) {
        //获取当前时间
        CFAbsoluteTime now = CFAbsoluteTimeGetCurrent();
        //获取当前线程id
        NSString *threadNumber = [[[NSString stringWithFormat:@"%@",[NSThread currentThread]] componentsSeparatedByString:@"number = "].lastObject componentsSeparatedByString:@","].firstObject;
        privateCellModelIdentifier = [NSString stringWithFormat:@"%lf%@",now,threadNumber];
    }
    
    return self;
}

- (NSString *)identifier {
    return privateCellModelIdentifier;
}

+ (BOOL)accessInstanceVariablesDirectly {
    return NO;
}
@end
