//
//  LDTitleTableViewCell.m
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDTitleTableViewCell.h"

@implementation LDTitleTableViewCell

#pragma mark - Setter Mothods
- (void)setCellModel:(LDBaseCellModel *)cellModel {
    [super setCellModel:cellModel];
    
    LDTitleCellModel *cellMoldel = (LDTitleCellModel *)cellModel;
    if(cellMoldel.attributeTitle){
        self.textLabel.attributedText = cellMoldel.attributeTitle;
    }else{
        self.textLabel.text = cellMoldel.title;
        self.textLabel.textColor = cellMoldel.titleColor;
        self.textLabel.font = cellMoldel.titleFont;
    }
    self.textLabel.textAlignment = cellMoldel.titileTextAlignment;
    self.imageView.image = cellMoldel.icon;
    
    
    self.arrow.hidden = !cellMoldel.showArrow;
    self.selectionStyle = cellMoldel.selectionStyle;
    self.arrow.image = cellMoldel.arrowImage;
    
    [self.arrow mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellMoldel.arrowWidth));
        make.height.equalTo(@(cellMoldel.arrowHeight));
        make.right.equalTo(self.contentView).offset(- cellMoldel.controlRightOffset);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
}

#pragma mark - Init Mothods
+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    
    LDTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[LDTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI {
    
    [super setupUI];
    
    //设置图片约束
    [self makeConstraints];
}

- (void)makeConstraints {
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-LD_KCellMargin);
        make.width.equalTo(@(LD_KArrowWidth));
        make.height.equalTo(@(LD_kArrowHeight));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
}



#pragma mark - lazy
- (UIImageView *)arrow {
    if (_arrow == nil) {
        UIImageView *arrow = [[UIImageView alloc] init];
        [self.contentView addSubview:arrow];
        _arrow = arrow;
    }
    return _arrow;
}


@end
