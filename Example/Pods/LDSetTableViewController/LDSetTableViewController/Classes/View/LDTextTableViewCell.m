//
//  LDShowTextRightCell.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDTextTableViewCell.h"

@interface LDTextTableViewCell()

/* 详细文本内容 **/
@property (nonatomic, weak) UILabel *detailLabel;

@end
@implementation LDTextTableViewCell

#pragma mark - Setter Mothods
- (void)setCellModel:(LDBaseCellModel *)cellModel {
    [super setCellModel:cellModel];
    
    LDTextCellModel *rightModel = (LDTextCellModel *)cellModel;
    if(rightModel.attributeDetailText){
        self.detailLabel.numberOfLines = 1;
        self.detailLabel.attributedText = rightModel.attributeDetailText;
    }else{
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.text = rightModel.detailText;
        self.detailLabel.textColor = rightModel.detailColor ;
        self.detailLabel.font = rightModel.detailFont;
    }
    
    //根据箭头显示设置约束
    if(rightModel.showArrow){
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(- rightModel.controlRightOffset - rightModel.arrowControlRightOffset - rightModel.arrowWidth);
        }];
    }else{
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(- rightModel.controlRightOffset);
        }];
    }
    
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(rightModel.leftPading);
    }];
}

#pragma mark - Init Mothods
+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    
    LDTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[LDTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)setupUI {
    //先实现super调用
    [super setupUI];
    
    [self makeConstraints];
}

- (void)makeConstraints {

    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-LD_KCellMargin-LD_KCellMargin/2 - LD_KArrowWidth);
        make.left.equalTo(self.contentView).offset(LD_KCellTextLeftPading);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
}


#pragma mark - lazy
- (UILabel *)detailLabel {
    
    if (_detailLabel == nil) {
        
        UILabel *detailTextLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        detailTextLabel.numberOfLines = 0;
        detailTextLabel.textAlignment = NSTextAlignmentRight;
        
        [self.contentView addSubview:detailTextLabel];
        
        _detailLabel = detailTextLabel;
    }
    return _detailLabel;
}

@end
