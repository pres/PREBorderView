//
//  UIView+PREBorderView.m
//  PREBorderViewSample
//
//  Created by Paul Steinhilber on 30.06.2013.
//  Copyright (c) 2013 Paul Steinhilber. All rights reserved.
//

#import "UIView+PREBorderView.h"

@implementation UIView (PREBorderView)

#pragma mark - default border

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

#pragma mark - complete border

- (void)addOneRetinaPixelBorder {
    [self addBorderWithColor:self.defaultBorderColor andWidth:0.5];
}

- (void)addOneRetinaPixelBorderWithColor:(UIColor*)color {
    [self addBorderWithColor:color andWidth:0.5];
}

- (void)addBorderWithColor:(UIColor *)color andWidth:(float)lineWidth {
    self.layer.borderWidth = lineWidth;
    self.layer.borderColor = color.CGColor;
}

#pragma mark - single side border

- (void)addOneRetinaPixelLineAtPosition:(enum PREBorderPosition)position {
    [self addOneRetinaPixelLineWithColor:self.defaultBorderColor atPosition:position];
}

- (void)addOneRetinaPixelLineWithColor:(UIColor*)color atPosition:(enum PREBorderPosition)position {
    [self addLineWithColor:color andWidth:0.5 atPosition:position];
}

- (void)addLineWithWidth:(float)lineWidth atPosition:(enum PREBorderPosition)position {
    [self addLineWithColor:self.defaultBorderColor andWidth:lineWidth atPosition:position];
}

- (void)addLineWithColor:(UIColor*)color andWidth:(float)lineWidth atPosition:(enum PREBorderPosition)position {

    if (!([UIScreen mainScreen].scale == 2) && lineWidth<1) {
        lineWidth = 1;
    }

    CALayer *border = [CALayer layer];
    switch (position) {
        case PREBorderPositionTop:
            border.frame = CGRectMake(0, 0, self.frame.size.width, lineWidth);
            break;

        case PREBorderPositionBottom:
            border.frame = CGRectMake(0, self.frame.size.height-lineWidth, self.frame.size.width, lineWidth);
            break;

        case PREBorderPositionLeft:
            border.frame = CGRectMake(0, 0, lineWidth, self.frame.size.height);
            break;

        case PREBorderPositionRight:
            border.frame = CGRectMake(self.frame.size.width-lineWidth, 0, lineWidth, self.frame.size.height);
            break;
    }

    border.backgroundColor = color.CGColor;

    [self removeBorderAtPosition:position];
    [border setValue:@([self tagForPosition:position]) forKey:@"tag"];
    [self.layer addSublayer:border];
}

#pragma mark -

- (int)tagForPosition:(enum PREBorderPosition)position {
    
    int tag = 32147582;

    switch (position) {
        case PREBorderPositionTop:    return tag;
        case PREBorderPositionBottom: return tag + 1;
        case PREBorderPositionLeft:   return tag + 2;
        case PREBorderPositionRight:  return tag + 3;
    }

    NSAssert(NO, @"invalid position");
    return 0;
}

- (void)removeBorderAtPosition:(enum PREBorderPosition)position {

    int tag = [self tagForPosition:position];

    __block CALayer *toRemove;

    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer valueForKey:@"tag"] intValue] == tag) {
            *stop = YES;
            toRemove = layer;
        }
    }];

    [toRemove removeFromSuperlayer];
}

- (void)removeAllBorders {
    
    [self removeBorderAtPosition:PREBorderPositionTop];
    [self removeBorderAtPosition:PREBorderPositionBottom];
    [self removeBorderAtPosition:PREBorderPositionLeft];
    [self removeBorderAtPosition:PREBorderPositionRight];
}

@end
