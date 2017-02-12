//
//  CircleProgressView.m
//  ZCAnimation
//
//  Created by LuzhiChao on 17/2/9.
//  Copyright © 2017年 LuzhiChao. All rights reserved.
//

#import "CircleProgressView.h"

#define DegressToRadius(ang) (M_PI*(ang)/180.0f)// 角度转换成PI
#define UIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@interface CircleProgressView ()
{
    CAShapeLayer *_progressLayer;
}

@end

@implementation CircleProgressView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.lineWidth = 3;
    self.isGradient = NO;
}

- (void)drawRect:(CGRect)rect {
    // 设置贝塞尔曲线,参数依次为这段圆弧的中心，半径，开始角度，结束角度，是否顺时针方向,顺时针时最左边是-180度，最右边是0，逆时针时最左边是180度，最右边是360度。
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:(self.frame.size.width)/2-self.lineWidth startAngle:DegressToRadius(-240) endAngle:DegressToRadius(60) clockwise:YES];
    // 线条
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor=[UIColor greenColor].CGColor;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = self.lineWidth;
    //渐变图层
    CALayer * grain = [CALayer layer];
    
    // 颜色是否渐变
    if (!self.isGradient) {
        // 默认红色
        CAGradientLayer *gradientLayer =  [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        [gradientLayer setColors:[NSArray arrayWithObjects:(id)[[UIColor redColor] CGColor],(id)[[UIColor redColor]CGColor], nil]];
        [gradientLayer setLocations:@[@0.2, @0.5, @0.7, @1]];
        [gradientLayer setStartPoint:CGPointMake(0, 0)];
        [gradientLayer setEndPoint:CGPointMake(1, 0)];
        [grain addSublayer:gradientLayer];
        
    }else {
        // 渐变色
        CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(0, 0, self.bounds.size.width/2, self.bounds.size.height);
        [gradientLayer1 setColors:[NSArray arrayWithObjects:(id)[[UIColor blackColor] CGColor],(id)[UIColorWithRGB(142, 66, 60) CGColor], nil]];
        [gradientLayer1 setLocations:@[@0.1,@0.9]];
        [gradientLayer1 setStartPoint:CGPointMake(0.05, 1)];
        [gradientLayer1 setEndPoint:CGPointMake(0.9, 0)];
        [grain addSublayer:gradientLayer1];
        
        CAGradientLayer * gradientLayer2 = [CAGradientLayer layer];
        gradientLayer2.frame = CGRectMake(self.bounds.size.width/2-10, 0, self.bounds.size.width/2+10, self.bounds.size.height);
        [gradientLayer2 setColors:[NSArray arrayWithObjects:(id)[UIColorWithRGB(142, 66, 60) CGColor],(id)[[UIColor redColor] CGColor], nil]];
        [gradientLayer2 setLocations:@[@0.3,@1]];
        [gradientLayer2 setStartPoint:CGPointMake(0.9, 0.05)];
        [gradientLayer2 setEndPoint:CGPointMake(1, 1)];
        [grain addSublayer:gradientLayer2];
    }
    
    //用progressLayer来截取渐变层 遮罩
    [grain setMask:_progressLayer];
    [self.layer addSublayer:grain];
    //增加动画
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];// CAShapeLayer的strokeStart和strokeEnd属性
    pathAnimation.duration = 4;// 动画执行时间
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];// 动画速度变化
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];// 设定动画起始帧
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];// 设定动画结束帧
    pathAnimation.autoreverses=NO;// 动画结束时是否执行逆动画
    pathAnimation.repeatCount = HUGE_VALF; // 重复次数。永久重复的话设置为HUGE_VALF。
    
    _progressLayer.path=path.CGPath;
    [_progressLayer addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
}


@end
