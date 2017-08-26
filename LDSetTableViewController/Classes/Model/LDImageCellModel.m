//
//  LDBigImageCellModel.m
//  LDSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "LDImageCellModel.h"
#import "LDImageTableViewCell.h"

@implementation LDImageCellModel
- (instancetype)initWithTitle:(NSString *)title placeholderImage:(UIImage *)placeholderImage imageUrl:(NSString *)imageUrl actionBlock:(LDBaseCellModelClickActionBlock)actionblock imageBlock:(LDImageCellModelClickImageBlock)imageBlock {
    
    if (self = [super initWithTitle:title actionBlock:actionblock]) {
        self.placeHoderImage = placeholderImage;
        self.imageUrl = imageUrl;
        self.imageBlock = imageBlock;
        self.imageSize = CGSizeMake(LD_KImageWidth, LD_KImageHeight);
        self.cornerRadius = .0f;
        self.cellHeight  = LD_KImageCellHeight;
    }
    return self;
}

- (NSString *)cellClass {
    
    return NSStringFromClass(LDImageTableViewCell.class);
}

@end
