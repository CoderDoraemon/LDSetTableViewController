//
//  LDSetTableViewController.h
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDSetHeader.h"
#import "LDBaseCellModel.h"

@interface LDSetTableViewController : UIViewController

@property (nonatomic, weak) UITableView *ld_tableView;  ///<tableView

@property (nonatomic, strong) NSMutableArray *ld_dataArray;  ///<数据源


/**
 更新cell模型方法
 
 @param cellModel model
 */
- (void)updateCellModel:(LDBaseCellModel *)cellModel;

/**
 更新cell模型方法
 
 @param cellModel model
 @param animation 动画效果
 */
- (void)updateCellModel:(LDBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation;

/**
 footer 高度 tableView代理方法
 
 @param tableView tableView
 @param section section
 @return footer高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;



/**
 footer View tableView代理方法
 
 @param tableView tableView
 @param section section
 @return footer View
 */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;


/**
 header view tableView代理方法
 
 @param tableView tableView
 @param section section
 @return header
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;


/**
 header 高度 tableView代理方法
 
 @param tableView tableView
 @param section section
 @return header 高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;

@end
