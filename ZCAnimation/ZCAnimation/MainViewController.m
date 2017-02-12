//
//  MainViewController.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/9.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ZCAnimationDemo";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
 
    [self addTitle:@"CircleProgress" className:@"CircleProgressDemo"];
    [self addTitle:@"Wave" className:@"WaveDemo"];
    [self addTitle:@"Clock" className:@"ClockDemo"];
}

- (void)addTitle:(NSString *)title className:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    UIViewController *ctrl = [NSClassFromString(className) new];
    ctrl.title = self.titles[indexPath.row];
    [self.navigationController pushViewController:ctrl animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
