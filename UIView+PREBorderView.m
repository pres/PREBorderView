//
// UIView+PREBorderView.m
//
// Copyright (c) 2013-15 Paul Steinhilber (http://paulsteinhilber.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
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

- (void)addRetinaPixelBorder {
    [self addRetinaPixelBorderWithColor:self.defaultBorderColor];
}

- (void)addRetinaPixelBorderWithColor:(UIColor*)color {
    
    double retinaPixelSize = 1./[UIScreen mainScreen].scale;
    [self addBorderWithColor:color andWidth:retinaPixelSize];
}

- (void)addBorderWithColor:(UIColor *)color andWidth:(float)lineWidth {
    self.layer.borderWidth = lineWidth;
    self.layer.borderColor = color.CGColor;
}

#pragma mark - single side border

- (void)addRetinaPixelBorderAtPosition:(PREBorderPosition)position {
    [self addRetinaPixelBorderWithColor:self.defaultBorderColor atPosition:position];
}

- (void)addRetinaPixelBorderWithColor:(UIColor*)color atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:color andWidth:self.devicePixelSize atPosition:position];
}


- (void)addBorderWithWidth:(float)lineWidth atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:self.defaultBorderColor andWidth:lineWidth atPosition:position];
}

- (void)addBorderWithColor:(UIColor*)color andWidth:(float)lineWidth atPosition:(PREBorderPosition)position {
    
    // min lineweight is one device pixel
    lineWidth = MAX(self.devicePixelSize, lineWidth);

    CALayer *border = [CALayer layer];
    CGRect frame;
    
    switch (position) {
        case PREBorderPositionTop:
            frame = CGRectMake(0, 0, self.frame.size.width, lineWidth);
            break;

        case PREBorderPositionBottom:
            frame = CGRectMake(0, self.frame.size.height-lineWidth, self.frame.size.width, lineWidth);
            break;

        case PREBorderPositionLeft:
            frame = CGRectMake(0, 0, lineWidth, self.frame.size.height);
            break;

        case PREBorderPositionRight:
            frame = CGRectMake(self.frame.size.width-lineWidth, 0, lineWidth, self.frame.size.height);
            break;
            
        case PREBorderPositionTopOutside:
            frame = CGRectMake(0, -lineWidth, self.frame.size.width, lineWidth);
            if ([self borderAtPosition:PREBorderPositionLeftOutside]) {
                frame.origin.x = -[self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
                frame.size.width += [self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
            }
            if ([self borderAtPosition:PREBorderPositionRightOutside]) {
                frame.size.width += [self borderAtPosition:PREBorderPositionRightOutside].frame.size.width;
            }
            break;
            
        case PREBorderPositionBottomOutside:
            frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, lineWidth);
            if ([self borderAtPosition:PREBorderPositionLeftOutside]) {
                frame.origin.x = -[self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
                frame.size.width += [self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
            }
            if ([self borderAtPosition:PREBorderPositionRightOutside]) {
                frame.size.width += [self borderAtPosition:PREBorderPositionRightOutside].frame.size.width;
            }
            break;
            
        case PREBorderPositionLeftOutside:
            frame = CGRectMake(-lineWidth, 0, lineWidth, self.frame.size.height);
            if ([self borderAtPosition:PREBorderPositionTopOutside]) {
                frame.origin.y = -[self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
                frame.size.height += [self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
            }
            if ([self borderAtPosition:PREBorderPositionBottomOutside]) {
                frame.size.height += [self borderAtPosition:PREBorderPositionBottomOutside].frame.size.height;
            }
            break;
            
        case PREBorderPositionRightOutside:
            frame = CGRectMake(self.frame.size.width, 0, lineWidth, self.frame.size.height);
            if ([self borderAtPosition:PREBorderPositionTopOutside]) {
                frame.origin.y = -[self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
                frame.size.height += [self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
            }
            if ([self borderAtPosition:PREBorderPositionBottomOutside]) {
                frame.size.height += [self borderAtPosition:PREBorderPositionBottomOutside].frame.size.height;
            }
            break;
    }

    border.frame = frame;
    border.backgroundColor = color.CGColor;

    [self removeBorderAtPosition:position];
    [border setValue:@([self tagForPosition:position]) forKey:@"tag"];
    [self.layer addSublayer:border];
}

#pragma mark -

- (CALayer*)borderAtPosition:(PREBorderPosition)position {

    int tag = [self tagForPosition:position];
    
    __block CALayer *border;
    
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer *layer, NSUInteger idx, BOOL *stop) {
        if ([[layer valueForKey:@"tag"] intValue] == tag) {
            *stop = YES;
            border = layer;
        }
    }];
    
    return border;
}

#pragma mark - border removal

- (void)removeBorderAtPosition:(PREBorderPosition)position {

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
    
    [self removeBorderAtPosition:PREBorderPositionTopOutside];
    [self removeBorderAtPosition:PREBorderPositionBottomOutside];
    [self removeBorderAtPosition:PREBorderPositionLeftOutside];
    [self removeBorderAtPosition:PREBorderPositionRightOutside];
}

#pragma mark -

- (int)tagForPosition:(PREBorderPosition)position {
    
    int tag = 32147582;
    
    switch (position) {
        case PREBorderPositionTop:              return tag;
        case PREBorderPositionBottom:           return tag + 1;
        case PREBorderPositionLeft:             return tag + 2;
        case PREBorderPositionRight:            return tag + 3;
            
        case PREBorderPositionTopOutside:       return tag + 4;
        case PREBorderPositionBottomOutside:    return tag + 5;
        case PREBorderPositionLeftOutside:      return tag + 6;
        case PREBorderPositionRightOutside:     return tag + 7;
    }
    
    NSAssert(NO, @"invalid position");
    return 0;
}

- (CGFloat)devicePixelSize {
    return 1./[UIScreen mainScreen].scale;
}

@end
