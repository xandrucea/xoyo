//
//  CAShapeLayer+Animations.m
//  xoyo
//
//  Created by Alexandru Ciocea on 24.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "CAShapeLayer+Animations.h"

@implementation CAShapeLayer (Animations)

- (void)startAnimateFillColor:(UIColor *)color withValue:(NSString *)value withDelegate:(id)delegate {
    CABasicAnimation *colorAnimation = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    colorAnimation.fromValue = (id)[UIColor whiteColor].CGColor;
    colorAnimation.toValue = (id)color.CGColor;
    colorAnimation.duration = 0.5f;
    colorAnimation.repeatCount = 0;
    colorAnimation.autoreverses = NO;
    colorAnimation.removedOnCompletion = NO;
    colorAnimation.fillMode = kCAFillModeForwards;
    [colorAnimation setDelegate:delegate];
    [colorAnimation setValue:value forKey:@"id"];
    [self addAnimation:colorAnimation forKey:@"bg"];
}

- (void)startAnimateStrokeEndWithDuration:(CFTimeInterval)duration withValue:(NSString *)value withDelegate:(id)delegate{
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.fromValue = @0.0f;
    pathAnimation.toValue = @(1.0);
    [pathAnimation setDelegate:delegate];
    [pathAnimation setValue:value forKey:@"id"];
    [self addAnimation:pathAnimation forKey:@"basic"];
}

@end
