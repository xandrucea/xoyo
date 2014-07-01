//
//  Lines.m
//  xoyo
//
//  Created by Alexandru Ciocea on 20.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "Lines.h"
#import "MyBasicAnimation.h"
#import "ViewController.h"
#import "CAShapeLayer+Animations.h"
#import "ARAudioRecognizer.h"
#import <CoreMotion/CoreMotion.h>

@implementation Lines{
    
    ARAudioRecognizer *_audio;
    
    BOOL _bHeader;
    
    CAShapeLayer *_shapeHeader;
    CAShapeLayer *_shapeView;
    
    CGFloat _sizeWidth;
    CGFloat _sizeHeight;

    CGRect rectHeader;
    
    UIBezierPath *_pathLine;
    UIBezierPath *_pathHeader;
    NSString *strName;
    
    int _counter;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

        [self setBackgroundColor:[UIColor redColor]];

        _sizeWidth = [UIScreen mainScreen].bounds.size.width;
        _sizeHeight = [UIScreen mainScreen].bounds.size.height;
        
        _audio = [[ARAudioRecognizer alloc] init];
        [_audio setDelegate:self];
        
        [self initHeader];
        
        _bHeader = NO;
        
    }
    return self;
}

- (void)audioRecognized:(ARAudioRecognizer *)recognizer{
    
}

- (void)audioLevelUpdated:(ARAudioRecognizer *)recognizer
             averagePower:(float)averagePower
                peakPower:(float)peakPower{
    
    [_shapeView setFillColor:[UIColor colorWithRed:abs(peakPower * 4) / 255.0f
                                             green:0.0f / 255.0f
                                              blue:0.0f
                                             alpha:1.0f].CGColor];
    
    [_shapeHeader setFillColor:[UIColor colorWithRed:0.0
                                               green:abs(averagePower * 4) / 255.0f
                                                blue:0.0f
                                               alpha:1.0f].CGColor];
}

- (void)initHeader{
    
    UIBezierPath *pathView = [UIBezierPath bezierPathWithRect:self.frame];
    _shapeView = [self shapeForPath:[pathView CGPath]];
    
    rectHeader = CGRectMake(0.0,
                            0.0,
                            _sizeWidth,
                            100.0f);
    _pathHeader = [UIBezierPath bezierPathWithRect:rectHeader];
    _shapeHeader = [self shapeForPath:[_pathHeader CGPath]];
    [_shapeHeader startAnimateStrokeEndWithDuration:1.0f
                                          withValue:@"basicAnimationd"
                                       withDelegate:self];
}

- (CAShapeLayer *)shapeForPath:(CGPathRef)pathRef{
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = pathRef;
    shapeLayer.strokeColor = [[UIColor lightGrayColor] CGColor];
    shapeLayer.fillColor = nil;
    shapeLayer.lineWidth = 1.5f;
    shapeLayer.lineJoin = kCALineJoinBevel;
    
    [self.layer addSublayer:shapeLayer];
    return shapeLayer;
}

- (void)drawRect:(CGRect)rect {

    if( _bHeader ){
        [[UIColor redColor] setStroke];
        [_pathHeader stroke];
    }
}

- (CGPathRef)initRect{
    CGRect rectPath = CGRectMake(100,
                                 100,
                                 100,
                                 200);
    _pathLine = [UIBezierPath bezierPathWithRect:rectPath];
    return [_pathLine CGPath];
}

-(CGPathRef)getTrianglePath
{
    UIBezierPath* triangle = [UIBezierPath bezierPath];
    [triangle moveToPoint:CGPointZero];
    [triangle addLineToPoint:CGPointMake(200,0)];
    [triangle addLineToPoint:CGPointMake(0, 300)];
    [triangle closePath];
    return [triangle CGPath];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self performSelector:@selector(touchesBegan:withEvent:) withObject:touches afterDelay:0.1];
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self];
//    NSLog(@"Height : %@", NSStringFromCGPoint(point));
//    if( point.y >  rectHeader.size.height ){
//        [_shapeHeader startAnimateStrokeEndWithDuration:0.1f
//                                              withValue:@"basicAnimation"
//                                           withDelegate:self];
//    }
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    
    
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"again %d", _counter++);
    if( [[anim valueForKey:@"id"] isEqual:@"basicAnimation"] ){
        [_shapeHeader startAnimateFillColor:[UIColor redColor]
                                  withValue:@"bgHeader"
                               withDelegate:self];
        return;
    }
    
    if( [[anim valueForKey:@"id"] isEqual:@"bgHeader"] ){
        [_shapeView startAnimateFillColor:[UIColor yellowColor]
                                withValue:@"bgView"
                             withDelegate:self];
    }
    
    if( [[anim valueForKey:@"id"] isEqual:@"bgView"] ){
        [_shapeHeader startAnimateStrokeEndWithDuration:0.1
                                              withValue:@"basicAnimation"
                                           withDelegate:self];
    }
}


@end
