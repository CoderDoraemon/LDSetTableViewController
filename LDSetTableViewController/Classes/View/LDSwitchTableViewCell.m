//
//  LDShowSwitchRightCell.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDSwitchTableViewCell.h"
#import "LDSetTableViewController.h"
#import "LDSwitchCellModel.h"
#import "UIView+LDFrame.h"

@interface LDSwitchTableViewCell()

/* 开关 **/
@property (nonatomic, weak)UISwitch *switchItem;  ///<开关

@end

@implementation LDSwitchTableViewCell

#pragma mark - Setter Mothods
- (void)setCellModel:(LDBaseCellModel *)cellModel {
    [super setCellModel:cellModel];
    
    LDSwitchCellModel *switchModel = (LDSwitchCellModel *)cellModel;
    self.switchItem.on = switchModel.on;
    if(switchModel.onTintColor){
        self.switchItem.onTintColor = switchModel.onTintColor;
    }
    
    [self.switchItem mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(- switchModel.controlRightOffset);
    }];
}

#pragma mark - Init Mothods
//cell初始化方法
+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView;
{
    LDSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[LDSwitchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)setupUI
{
    [super setupUI];
    
    //添加开关控件
    [self makeConstraints];
}

- (void)makeConstraints {
    
    [self.switchItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-LD_KCellMargin);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.height.equalTo(@(LD_KSwitchHeight));
    }];
}

- (void)switchChang:(UISwitch *)switchItem
{
    LDSwitchCellModel *model =
    (LDSwitchCellModel *)self.cellModel;
    model.on = switchItem.on;
    if(model.switchBlock){
        model.switchBlock(self.cellModel,switchItem.on);
    }
    
   
}


#pragma mark - lazy
- (UISwitch *)switchItem {
    if (_switchItem == nil) {
        UISwitch *switchItem = [[UISwitch alloc] initWithFrame:CGRectZero];
        [switchItem addTarget:self action:@selector(switchChang:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:switchItem];
        _switchItem = switchItem;
    }
    return _switchItem;
}

@end
