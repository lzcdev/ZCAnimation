//
//  CircleProgressDemo.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/9.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "CircleProgressDemo.h"
#import "CircleProgressView.h"
@interface CircleProgressDemo ()

@end

@implementation CircleProgressDemo

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    CircleProgressView *circleView = [[CircleProgressView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 200, 200, 200)];
    circleView.backgroundColor = [UIColor yellowColor];
    //circleView.lineWidth = 1;
    //circleView.isGradient = YES;
    [self.view addSubview:circleView];
    
  }

@end
