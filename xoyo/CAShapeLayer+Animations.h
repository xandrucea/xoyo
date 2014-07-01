//
//  CAShapeLayer+Animations.h
//  xoyo
//
//  Created by Alexandru Ciocea on 24.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#define acFillColor @"fillColor"
#define acFillRule @"fillRule"
#define acLineCap @"lineCap"
#define lineDashPattern @"lineDashPattern"
#define lineDashPhase @"lineDashPhase"
#define lineJoin @"lineJoin"
#define lineWidth @"lineWidth"
#define miterLimit @"miterLimit"
#define strokeColor @"strokeColor"
#define acStrokeStart @"strokeStart"
#define acStrokeEnd @"strokeEnd"

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (Animations)

- (void)startAnimateFillColor:(UIColor *)color withValue:(NSString *)value withDelegate:(id)delegate;
- (void)startAnimateStrokeEndWithDuration:(CFTimeInterval)duration withValue:(NSString *)value withDelegate:(id)delegate;

@end
