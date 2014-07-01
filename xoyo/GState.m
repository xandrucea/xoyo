//
//  GState.m
//  xoyo
//
//  Created by Alexandru Ciocea on 29.06.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "GState.h"

@implementation GState{
    
    CGRect _rectImage;
    
    UIBezierPath *_pathOne;
    UIBezierPath *_pathRect;
    
    UIColor *_greenColor;
    UIColor *_purpleColor;
    
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self initVars];
    }
    return self;
}

- (void)initVars{
    _greenColor = [UIColor greenColor];
    _purpleColor = [UIColor purpleColor];
    
    _rectImage = CGRectMake(100, 100, 200, 200);
    
    _pathOne = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 50, 50)];
    _pathRect = [UIBezierPath bezierPathWithRect:_rectImage];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // set initial stroke / fill colors
    [_greenColor setFill];
    [_purpleColor setStroke];
    
    // draw path
    [_pathOne fill];
    [_pathOne stroke];
    
    //saving context state
    CGContextSaveGState(context);
    
    [[UIColor orangeColor] setFill];
    [[UIColor blueColor] setStroke];
    
    // move then
    [_pathOne applyTransform:CGAffineTransformMakeTranslation(50, 0)];
    
    [_pathOne fill];
    [_pathOne stroke];
    
    CGContextRestoreGState(context);
    
    //move again
    [_pathOne applyTransform:CGAffineTransformMakeTranslation(0, 50)];
    
    [_pathOne fill];
    [_pathOne stroke];
    
    
    [_purpleColor setStroke];
    [_pathRect stroke];
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_rectImage];
    [self addSubview:imageView];
    [imageView setImage:image];
}


@end
