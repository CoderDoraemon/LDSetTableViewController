//
//  LDShowBigImageCell.m
//  LDSetTableView
//
//  Created by hushaohui on 2017/4/21.
//  Copyright © 2017年 ZLHD. All rights reserved.
//

#import "LDImageTableViewCell.h"

@interface LDImageTableViewCell()

/* 右边图片显示 **/
@property (nonatomic, weak)UIImageView *bigImageView;

@end

@implementation LDImageTableViewCell

#pragma mark - Setter Mothods
- (void)setCellModel:(LDBaseCellModel *)cellModel {
    [super setCellModel:cellModel];
    
    LDImageCellModel *bigModel = (LDImageCellModel *)cellModel;
    if(!bigModel.imageIcon){
        [self.bigImageView sd_setImageWithURL: [NSURL URLWithString:bigModel.imageUrl] placeholderImage:bigModel.placeHoderImage];
    }else{
        self.bigImageView.image = bigModel.imageIcon;
    }
    
    self.bigImageView.layer.cornerRadius = bigModel.cornerRadius > 0 ? bigModel.cornerRadius : 0.f;
    
    [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(bigModel.imageSize.width));
        make.height.equalTo(@(bigModel.imageSize.height));
    }];
    
    //根据箭头显示设置约束
    if (bigModel.showArrow) {
        [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(- bigModel.controlRightOffset - bigModel.arrowControlRightOffset - bigModel.arrowWidth);
        }];
    } else {
        [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(- bigModel.controlRightOffset);
        }];
    }
}

#pragma mark - Init Mothods
+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView; {
    
    LDImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[LDImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

- (void)setupUI {
    [super setupUI];
    
    //添加默认图片
    
    [self makeConstraints];
}

//设置大图约束
- (void)makeConstraints {
    
    [self.bigImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.equalTo(@(LD_KImageWidth));
        make.height.equalTo(@(LD_KImageWidth));
    }];
    
}



//点击图片
- (void)clickImage:(UITapGestureRecognizer *)tap
{
    LDImageCellModel *bigModel = (LDImageCellModel *)self.cellModel;
    if(bigModel.imageBlock){
        bigModel.imageBlock(self.cellModel);
    }
}

#pragma mark - lazy
- (UIImageView *)bigImageView {
    
    if (_bigImageView == nil) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
        [imageView addGestureRecognizer:tap];
        
        [self.contentView addSubview:imageView];
        
        _bigImageView = imageView;
    }
    return _bigImageView;
}


@end
