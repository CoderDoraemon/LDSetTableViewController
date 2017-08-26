//
//  LDBaseTableViewCell.h
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDSetHeader.h"
#import "LDBaseCellModel.h"

@interface LDBaseTableViewCell : UITableViewCell

/* 数据模型 **/
@property (nonatomic, strong) LDBaseCellModel *cellModel;

/* 顶部分割线 **/
@property (nonatomic, weak) CALayer *topLine;

/* 底部分割线 **/
@property (nonatomic, weak) CALayer *bottomLine;

/**
 cell初始化方法

 @param cellIdentifier cell标识
 @param tableView tableView
 @return cell
 */
+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;

/**
 初始化UI方法
 */
- (void)setupUI;

/**
 获取cell高度方法

 @param model cell模型
 @return cell高度
 */
+ (CGFloat)getCellHeight:(LDBaseCellModel *)model;

@end
