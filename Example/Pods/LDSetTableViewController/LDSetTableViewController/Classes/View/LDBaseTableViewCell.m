//
//  LDBaseTableViewCell.m
//  LDSetTableView
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDBaseTableViewCell.h"

@implementation LDBaseTableViewCell

#pragma mark - Setter Mothods
- (void)setCellModel:(LDBaseCellModel *)cellModel {
    _cellModel = cellModel;
    
    self.selectionStyle = cellModel.selectionStyle;
    self.bottomLine.ld_y = cellModel.cellHeight - cellModel.separateHeight;
    self.bottomLine.ld_height = cellModel.separateHeight;
    self.topLine.ld_height = cellModel.separateHeight;
    
    self.bottomLine.backgroundColor = cellModel.separateColor.CGColor;
    self.topLine.backgroundColor = cellModel.separateColor.CGColor;
}

+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    
    LDBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
         cell = [[LDBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Init Mothods
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bottomLine.ld_width = self.frame.size.width;
    self.topLine.ld_width = self.frame.size.width;
}

- (void)setupUI {
    
    //添加顶部分割线
    self.topLine.frame = CGRectMake(0, 0, self.frame.size.width, LD_KSeparateHeight);
    
    //添加底部分割线
    self.bottomLine.frame = CGRectMake(0, 0, self.frame.size.width, LD_KSeparateHeight);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+ (CGFloat)getCellHeight:(LDBaseCellModel *)model {
    
    return model.cellHeight;
}

#pragma mark - lazy
- (CALayer *)topLine {
    if (_topLine == nil) {
        CALayer *topLine = [CALayer layer];
        topLine.backgroundColor = LD_KSeparateColor.CGColor;
        [self.contentView.layer addSublayer:topLine];
        _topLine = topLine;
    }
    return _topLine;
}

- (CALayer *)bottomLine {
    if (_bottomLine == nil) {
        CALayer *bottomLine = [CALayer layer];
        bottomLine.backgroundColor = LD_KSeparateColor.CGColor;
        [self.contentView.layer addSublayer:bottomLine];
        _bottomLine = bottomLine;
    }
    return _bottomLine;
}

@end
