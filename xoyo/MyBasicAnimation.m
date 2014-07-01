    //
//  MyBasicAnimation.m
//  xoyo
//
//  Created by Alexandru Ciocea on 24.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import "MyBasicAnimation.h"

@implementation MyBasicAnimation

- (NSString *)description{
    return [NSString stringWithFormat:@"CABasicAnimation %@, %f", self.byValue, self.duration];
}

@end
