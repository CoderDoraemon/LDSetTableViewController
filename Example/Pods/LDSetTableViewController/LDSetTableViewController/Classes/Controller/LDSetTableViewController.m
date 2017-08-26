//
//  LDSetTableViewController.m
//  LDSetTableViewControllerDemo
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 文刂Rn. All rights reserved.
//

#import "LDSetTableViewController.h"
#import "LDBaseTableViewCell.h"
#import "LDBaseCellModel.h"
#import "LDTextCellModel.h"
#import "LDSetHeader.h"

@interface LDSetTableViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation LDSetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.translatesAutoresizingMaskIntoConstraints = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    tableView.showsVerticalScrollIndicator = NO;
    
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_8_x_Max) {
        tableView.cellLayoutMarginsFollowReadableWidth = NO;
    }
    [self.view addSubview:tableView];
    self.ld_tableView = tableView;
    
    [self setupTableViewConstrint];
    
}

//设置tableView约束
- (void)setupTableViewConstrint {
    
    [self.ld_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.ld_dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray *rows = [self.ld_dataArray ld_objectWithIndex:section];
    NSAssert([rows isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *sections = [self.ld_dataArray ld_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    LDBaseCellModel *cellModel = (LDBaseCellModel *)[sections ld_objectWithIndex:indexPath.row];
    
    NSAssert([cellModel.class isSubclassOfClass:[LDBaseCellModel class]], @"此cellclass类别必须存在,并且继承LDBaseCellModel");
    
    Class class = NSClassFromString(cellModel.cellClass);
    NSAssert([class isSubclassOfClass:[LDBaseTableViewCell class]], @"此cellclass类别必须存在,并且继承LDBaseTableViewCell");
    
    LDBaseTableViewCell *cell = [class cellWithIdentifier:cellModel.cellClass tableView:tableView];
    
    
    
    cell.cellModel = cellModel;
    
    cell.topLine.hidden = (indexPath.row != 0);
    
    cell.bottomLine.ld_x = (indexPath.row == sections.count - 1 ? 0:cellModel.separateOffset);
    //处理分割线
    return cell;
}



#pragma mark tableView代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *sections = [self.ld_dataArray ld_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    LDBaseCellModel *cellModel = (LDBaseCellModel *)[sections ld_objectWithIndex:indexPath.row];
    
    Class class =  NSClassFromString(cellModel.cellClass);
    return [class getCellHeight:cellModel];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSMutableArray *sections = [self.ld_dataArray ld_objectWithIndex:indexPath.section];
    NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
    LDBaseCellModel *cellModel = (LDBaseCellModel *)[sections ld_objectWithIndex:indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:cellModel.actionBlock == nil];
    if(cellModel.actionBlock){
        cellModel.actionBlock(cellModel);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return  0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    //如果是第一个section
    if (section == 0) return nil;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, LD_SectionHeight)];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //默认
    if(section == 0) return 0.01;
    return LD_SectionHeight;
}


- (void)updateCellModel:(LDBaseCellModel *)cellModel {
    [self updateCellModel:cellModel animation:UITableViewRowAnimationFade];
}
- (void)updateCellModel:(LDBaseCellModel *)cellModel animation:(UITableViewRowAnimation)animation {
    
    //这里根据模型标题是否一样，是更新的哪个model
    NSMutableArray *tempData = [NSMutableArray arrayWithArray:self.ld_dataArray];
    [tempData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx2, BOOL * _Nonnull stop) {
            LDBaseCellModel *model  = (LDBaseCellModel *)obj;
            if([model.identifier isEqualToString:cellModel.identifier]){
                //找到section中的数组
                NSMutableArray *rows = [self.ld_dataArray ld_objectWithIndex:idx1];
                //找到某个具体哪一行，进行数据替换
                [rows replaceObjectAtIndex:idx2 withObject:cellModel];
                //更新cell
                NSIndexPath *path = [NSIndexPath indexPathForRow:idx2 inSection:idx1];
                [self.ld_tableView beginUpdates];
                [self.ld_tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:animation];
                [self.ld_tableView endUpdates];
                *stop = YES;
                return;
            }
        }];
    }];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    NSLog(@"控制器方法");
    __weak __typeof(&*self)weakSelf = self;
    [self.ld_dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableArray *sections = (NSMutableArray *)obj;
        NSAssert([sections isKindOfClass:[NSMutableArray class]], @"此对象必须为一个可变数组,请检查数据源组装方式是否正确!");
        [sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if([obj isKindOfClass:[LDTextCellModel class]]){
                LDTextCellModel *model = (LDTextCellModel *)obj;
                [model setDetailText:model.detailText];
                [weakSelf updateCellModel:model];
            }
        }];
        
    }];
}


- (NSMutableArray *)ld_dataArray {
    if (_ld_dataArray == nil) {
        _ld_dataArray = [NSMutableArray array];
    }
    return _ld_dataArray;
}

- (void)dealloc {
    
    if(self.ld_tableView){
        self.ld_tableView.delegate = nil;
        self.ld_tableView.dataSource = nil;
        [self.ld_tableView removeFromSuperview];
        self.ld_tableView = nil;
    }
    if(self.ld_dataArray.count){
        [self.ld_dataArray removeAllObjects];
        self.ld_dataArray = nil;
    }
    
}

@end
