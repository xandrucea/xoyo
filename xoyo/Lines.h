//
//  Lines.h
//  xoyo
//
//  Created by Alexandru Ciocea on 20.05.14.
//  Copyright (c) 2014 cococea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ARAudioRecognizerDelegate.h"

@interface Lines : UIView <ARAudioRecognizerDelegate>

@property (nonatomic, weak) CAShapeLayer *pathLayer;

@end
