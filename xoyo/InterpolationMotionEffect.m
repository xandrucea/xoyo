//
//  InterpolationMotionEffect.m
//  xoyo
//
//  Created by Alexandru Ciocea on 29.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "InterpolationMotionEffect.h"

@implementation InterpolationMotionEffect

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        [self initInterpolation];
    }
    return self;
}
- (void)initInterpolation{
    UIInterpolatingMotionEffect *xAxis;
    xAxis = [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.x"
             type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xAxis.minimumRelativeValue = @-140;
    xAxis.maximumRelativeValue = @140;
    
    UIInterpolatingMotionEffect *yAxis;
    yAxis = [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.y"
             type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yAxis.minimumRelativeValue = @-140;
    yAxis.maximumRelativeValue = @140;
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];
    
    [self addMotionEffect:group];
}


@end
