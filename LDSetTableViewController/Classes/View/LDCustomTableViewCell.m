//
//  LDCustomTableViewCell.m
//  LDSetTableViewCtrollerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDCustomTableViewCell.h"

@implementation LDCustomTableViewCell

+ (LDBaseTableViewCell *)cellWithIdentifier:(NSString *)cellIdentifier tableView:(UITableView *)tableView {
    
    LDCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        Class cellClass = NSClassFromString(cellIdentifier);
        NSAssert([cellClass isSubclassOfClass:[LDCustomTableViewCell class]], @"此cellclass类必须存在,并且继承LDCustomTableViewCell");
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

@end
