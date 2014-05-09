//
//  UIView+PREBorderView.m
//  PREBorderViewSample
//
//  Created by Paul Steinhilber on 30.06.2013.
//  Copyright (c) 2013 Paul Steinhilber. All rights reserved.
//

#import "UIView+PREBorderView.h"

@implementation UIView (PREBorderView)

static UIColor* _defaultBorderColor;

- (void)setDefaultBorderColor:(UIColor *)defaultBorderColor {
    _defaultBorderColor = defaultBorderColor;
}

- (UIColor *)defaultBorderColor {
    if (!_defaultBorderColor) {
        if ([self respondsToSelector:@selector(tintColor)]) {
            return self.tintColor;
        } else {
            return [UIColor blueColor];
        }
    } else {
        return _defaultBorderColor;
    }
}

- (void)addOneRetinaPixelBorder {
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = self.defaultBorderColor.CGColor;
}

- (void)addOneRetinaPixelBorderWithColor:(UIColor*)color {
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = color.CGColor;
}

- (void)addOneRetinaPixelLineAtPosition:(enum PREBorderPosition)position {
    [self addOneRetinaPixelLineWithColor:self.defaultBorderColor atPosition:position];
}

- (void)addOneRetinaPixelLineWithColor:(UIColor*)color atPosition:(enum PREBorderPosition)position {
    [self addLineWithColor:color andWidth:0.5 atPosition:position];
}

- (void)addLineWithWidth:(float)pixelWidth atPosition:(enum PREBorderPosition)position {
    [self addLineWithColor:self.defaultBorderColor andWidth:pixelWidth atPosition:position];
}

- (void)addLineWithColor:(UIColor*)color andWidth:(float)pixelWidth atPosition:(enum PREBorderPosition)position {
    
    if (!([UIScreen mainScreen].scale == 2) && pixelWidth<1) {
        pixelWidth = 1;
    }
    
    CALayer *border = [CALayer layer];
    switch (position) {
        case PREBorderPositionTop:
            border.frame = CGRectMake(0, 0, self.frame.size.width, pixelWidth);
            break;
            
        case PREBorderPositionBottom:
            border.frame = CGRectMake(0, self.frame.size.height-pixelWidth, self.frame.size.width, pixelWidth);
            break;
            
        case PREBorderPositionLeft:
            border.frame = CGRectMake(0, 0, pixelWidth, self.frame.size.height);
            break;
            
        case PREBorderPositionRight:
            border.frame = CGRectMake(self.frame.size.width-pixelWidth, 0, pixelWidth, self.frame.size.height);
            break;
    }
    
    border.backgroundColor = color.CGColor;
    [self.layer addSublayer:border];
}

@end