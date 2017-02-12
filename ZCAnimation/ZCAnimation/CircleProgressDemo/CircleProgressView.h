//
//  CircleProgressView.h
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/9.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView

///**
// 线条开始角度,顺时针时最左边是-180度，最右边是0度，逆时针时最左边是180度，最右边是360度。默认-240度
// */
//@property (nonatomic, assign) CGFloat startAngle;
///**
// 线条结束角度,顺时针时最左边是-180度，最右边是0度，逆时针时最左边是180度，最右边是360度。默认60度
// */
//@property (nonatomic, assign) CGFloat endAngle;
///**
// 顺时针-YES，逆时针-NO,默认顺时针
// */
//@property (nonatomic, assign) BOOL isClockwise;
///**
// 线条宽度,默认4
// */
@property (nonatomic, assign) CGFloat lineWidth;
///**
// 线条颜色，默认红色
// */
//@property (nonatomic, strong) UIColor *lineColor;
///**
// 重复次数，默认无限
// */
//@property (nonatomic, assign) float repeatCount;
///**
// 执行时间，默认4s
// */
//@property (nonatomic, assign) double duration;
///**
// 颜色是否渐变，仅供娱乐，颜色已经写死
// */
@property (nonatomic, assign) BOOL isGradient;

@end
