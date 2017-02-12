//
//  WaveDemo.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "WaveDemo.h"
#import "ZCWave.h"
@interface WaveDemo ()
{
    ZCWave *_headerView;
}
@end

@implementation WaveDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView = [[ZCWave alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    _headerView.backgroundColor = [UIColor colorWithRed:248/255.0 green:64/255.0 blue:87/255.0 alpha:1];
    _headerView.waveBlock = ^(CGFloat currentY){
    };
    [_headerView startWaveAnimation];
    
    self.tableView.tableHeaderView = _headerView;
    
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*3/8, 60, self.view.frame.size.width/4, self.view.frame.size.width/4)];
    headImage.image = [UIImage imageNamed:@"1.jpg"];
    headImage.layer.cornerRadius = self.view.frame.size.width/8;
    headImage.layer.masksToBounds = YES;
    [_headerView addSubview:headImage];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    cell.textLabel.text = @"大波浪~~";
    return cell;
}

@end
