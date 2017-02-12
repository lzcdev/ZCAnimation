//
//  ClockDemo.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/10.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "ClockDemo.h"

// 每秒秒针转6度
#define perSecondA 6
// 每分分针转6度
#define perMinuteA 6
// 每小时时针转30度
#define perHourA 30
// 每分时针转0.5度
#define perMinuteHourA 0.5
// 角度转弧度
#define angle2radian(x) ((x) / 180.0 * M_PI)

@interface ClockDemo ()
{
    CALayer *_second;
    CALayer *_minute;
    CALayer *_hour;
}
@property (weak, nonatomic) IBOutlet UIImageView *clockView;
@end

@implementation ClockDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加秒针
    [self addSecond];
    // 2.添加分针
    [self addMinute];
    // 3.添加时针
    [self addHour];
    // 4.创建定时器
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

// 添加秒针
- (void)addSecond
{
    CGFloat imageW = _clockView.bounds.size.width;
    CGFloat imageH = _clockView.bounds.size.height;
    
    // 1.添加秒针
    CALayer *second = [CALayer layer];
    
    // 2.设置锚点
    second.anchorPoint = CGPointMake(0.5, 1);
    
    // 3.设置位置
    second.position = CGPointMake(imageW * 0.5, imageH * 0.5);
    
    // 4.设置尺寸
    second.bounds = CGRectMake(0, 0, 1, imageH * 0.5 - 20);
    
    // 5.颜色
    second.backgroundColor = [UIColor redColor].CGColor;
    
    // 6.添加
    [_clockView.layer addSublayer:second];
    
    _second = second;
    
}

// 添加分针
- (void)addMinute
{
    CGFloat imageW = _clockView.bounds.size.width;
    CGFloat imageH = _clockView.bounds.size.height;
    
    // 1.添加分针
    CALayer *minute = [CALayer layer];
    
    // 2.设置锚点
    minute.anchorPoint = CGPointMake(0.5, 1);
    
    // 3.设置位置
    minute.position = CGPointMake(imageW * 0.5, imageH * 0.5);
    
    // 4.设置尺寸
    minute.bounds = CGRectMake(0, 0, 2, imageH * 0.5 - 30);
    
    // 5.颜色
    minute.backgroundColor = [UIColor blueColor].CGColor;
    
    // 6.添加
    [_clockView.layer addSublayer:minute];
    
    _minute = minute;
    
}

// 添加时针
- (void)addHour
{
    CGFloat imageW = _clockView.bounds.size.width;
    CGFloat imageH = _clockView.bounds.size.height;
    
    // 1.添加时针
    CALayer *hour = [CALayer layer];
    
    // 2.设置锚点
    hour.anchorPoint = CGPointMake(0.5, 1);
    
    // 3.设置位置
    hour.position = CGPointMake(imageW * 0.5, imageH * 0.5);
    
    // 4.设置尺寸
    hour.bounds = CGRectMake(0, 0, 4, imageH * 0.5 - 50);
    
    // 5.颜色
    hour.backgroundColor = [UIColor blackColor].CGColor;
    
    // 6.添加
    [_clockView.layer addSublayer:hour];
    
    _hour = hour;
    
    hour.cornerRadius = 4;
    
}

- (void)update
{
    // 获取日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取日期组件
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    // 获取秒数
    CGFloat sec = components.second;
    
    // 获取分钟数
    CGFloat minute = components.minute;
    
    //获取小时数
    CGFloat hour = components.hour;
    
    // 秒针旋转多少度
    CGFloat secondA = sec * perSecondA;
    
    // 分针旋转多少度
    CGFloat minuteA = minute * perMinuteA;
    
    // 时针旋转多少度
    CGFloat hourA = hour * perHourA;
    hourA += minute * perMinuteHourA;
    
    // 秒针
    _second.transform = CATransform3DMakeRotation(angle2radian(secondA), 0, 0, 1);
    // 时针
    _minute.transform = CATransform3DMakeRotation(angle2radian(minuteA), 0, 0, 1);
    // 分针
    _hour.transform = CATransform3DMakeRotation(angle2radian(hourA), 0, 0, 1);
}


@end
