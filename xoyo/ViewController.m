//
//  ViewController.m
//  xoyo
//
//  Created by Alexandru Ciocea on 20.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "ViewController.h"
#import "Lines.h"
#import "GState.h"
#import "InterpolationMotionEffect.h"

@interface ViewController ()

@end

@implementation ViewController{
    Lines *_lines;
    InterpolationMotionEffect *_intMotion;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rectLines = CGRectMake(self.view.frame.origin.x,
                                  self.view.frame.origin.y,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height);
//    _lines = [[Lines alloc] initWithFrame:rectLines];
//    [self.view addSubview:_lines];
    
//    CGRect rectInter = CGRectMake(100.0, 100.0, 200.0, 200.0);
//    _intMotion = [[InterpolationMotionEffect alloc] initWithFrame:rectInter];
//    [self.view addSubview:_intMotion];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    GState *states = [[GState alloc] initWithFrame:rectLines];
    [self.view addSubview:states];
    [states setNeedsDisplayInRect:states.frame];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
