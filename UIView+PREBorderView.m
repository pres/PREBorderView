//
//  UIView+PREBorderView.m
//
//  Copyright (c) 2013-17 Paul Steinhilber
//  http://paulsteinhilber.de
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "UIView+PREBorderView.h"

@implementation UIView (PREBorderView)

#pragma mark - default border

static UIColor* _defaultBorderColor;

- (void)setDefaultBorderColor:(UIColor*)defaultBorderColor {
    _defaultBorderColor = defaultBorderColor;
}

- (UIColor*)defaultBorderColor {
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

#pragma mark - set complete border

- (void)addRetinaPixelBorder {
    [self addRetinaPixelBorderWithColor:self.defaultBorderColor];
}

- (void)addRetinaPixelBorderWithColor:(UIColor*)color {
    
    double retinaPixelSize = 1./[UIScreen mainScreen].scale;
    [self addBorderWithColor:color andWidth:retinaPixelSize];
}

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)lineWidth {
    self.layer.borderWidth = lineWidth;
    self.layer.borderColor = color.CGColor;
}

#pragma mark - convenience

- (void)addRetinaPixelBorderAtPosition:(PREBorderPosition)position {
    [self addRetinaPixelBorderWithColor:self.defaultBorderColor atPosition:position];
}

- (void)addRetinaPixelBorderWithColor:(UIColor*)color atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:color andWidth:self.devicePixelSize atPosition:position];
}

- (void)addRetinaPixelBorderWithColor:(UIColor*)color andMargin:(CGFloat)margin atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:color andWidth:self.devicePixelSize withMargin:margin atPosition:position];
}

- (void)addBorderWithWidth:(CGFloat)lineWidth atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:self.defaultBorderColor andWidth:lineWidth atPosition:position];
}

- (void)addBorderWithWidth:(CGFloat)lineWidth andMargin:(CGFloat)margin atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:self.defaultBorderColor andWidth:self.devicePixelSize withMargin:margin atPosition:position];
}

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)lineWidth atPosition:(PREBorderPosition)position {
    [self addBorderWithColor:color andWidth:lineWidth withMargin:0 atPosition:position];
}

#pragma mark - set single side borders

- (void)addBorderWithColor:(UIColor*)color andWidth:(CGFloat)lineWidth withMargin:(CGFloat)margin atPosition:(PREBorderPosition)position {
    
    // min lineweight is one device pixel
    lineWidth = MAX(self.devicePixelSize, lineWidth);

    CALayer* border = [CALayer layer];
    CGRect frame;
    
    switch (position) {
        case PREBorderPositionTop:
            frame = CGRectMake(margin, 0, self.frame.size.width-2*margin, lineWidth);
            break;

        case PREBorderPositionBottom:
            frame = CGRectMake(margin, self.frame.size.height-lineWidth, self.frame.size.width-2*margin, lineWidth);
            break;

        case PREBorderPositionLeft:
            frame = CGRectMake(0, margin, lineWidth, self.frame.size.height-2*margin);
            break;

        case PREBorderPositionRight:
            frame = CGRectMake(self.frame.size.width-lineWidth, margin, lineWidth, self.frame.size.height-2*margin);
            break;
            
        case PREBorderPositionTopOutside:
            frame = CGRectMake(margin, -lineWidth, self.frame.size.width-2*margin, lineWidth);
            if ([self borderAtPosition:PREBorderPositionLeftOutside] && !margin) {
                frame.origin.x = -[self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
                frame.size.width += [self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
            }
            if ([self borderAtPosition:PREBorderPositionRightOutside] && !margin) {
                frame.size.width += [self borderAtPosition:PREBorderPositionRightOutside].frame.size.width;
            }
            break;
            
        case PREBorderPositionBottomOutside:
            frame = CGRectMake(margin, self.frame.size.height, self.frame.size.width-2*margin, lineWidth);
            if ([self borderAtPosition:PREBorderPositionLeftOutside] && !margin) {
                frame.origin.x = -[self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
                frame.size.width += [self borderAtPosition:PREBorderPositionLeftOutside].frame.size.width;
            }
            if ([self borderAtPosition:PREBorderPositionRightOutside] && !margin) {
                frame.size.width += [self borderAtPosition:PREBorderPositionRightOutside].frame.size.width;
            }
            break;
            
        case PREBorderPositionLeftOutside:
            frame = CGRectMake(-lineWidth, margin, lineWidth, self.frame.size.height-2*margin);
            if ([self borderAtPosition:PREBorderPositionTopOutside] && !margin) {
                frame.origin.y = -[self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
                frame.size.height += [self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
            }
            if ([self borderAtPosition:PREBorderPositionBottomOutside] && !margin) {
                frame.size.height += [self borderAtPosition:PREBorderPositionBottomOutside].frame.size.height;
            }
            break;
            
        case PREBorderPositionRightOutside:
            frame = CGRectMake(self.frame.size.width, margin, lineWidth, self.frame.size.height-2*margin);
            if ([self borderAtPosition:PREBorderPositionTopOutside] && !margin) {
                frame.origin.y = -[self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
                frame.size.height += [self borderAtPosition:PREBorderPositionTopOutside].frame.size.height;
            }
            if ([self borderAtPosition:PREBorderPositionBottomOutside] && !margin) {
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

#pragma mark - get border

- (CALayer*)borderAtPosition:(PREBorderPosition)position {

    int tag = [self tagForPosition:position];
    
    __block CALayer* border;
    
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

    __block CALayer* toRemove;

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

#pragma mark - resize

- (void)layoutSubviewBorders {
    [self.subviews makeObjectsPerformSelector:@selector(layoutSubviewBorders)];
    [self layoutIfNeeded];
    [self layoutBorders];
}

- (void)layoutBorders {
    NSArray<NSNumber*>* positions = @[@(PREBorderPositionTop), @(PREBorderPositionBottom), @(PREBorderPositionLeft), @(PREBorderPositionRight), @(PREBorderPositionTopOutside), @(PREBorderPositionBottomOutside), @(PREBorderPositionLeftOutside), @(PREBorderPositionRightOutside)];
    
    for (NSNumber* pos in positions) {
        CALayer* border = [self borderAtPosition:pos.unsignedIntegerValue];
        if (border) {
            UIColor* color = [UIColor colorWithCGColor:border.backgroundColor];
            CGFloat width;
            CGFloat margin;
            switch (pos.unsignedIntegerValue) {
                case PREBorderPositionTop:
                case PREBorderPositionBottom:
                case PREBorderPositionTopOutside:
                case PREBorderPositionBottomOutside:
                    width = border.frame.size.height;
                    margin = border.frame.origin.x;
                    break;
                    
                case PREBorderPositionLeft:
                case PREBorderPositionRight:
                case PREBorderPositionLeftOutside:
                case PREBorderPositionRightOutside:
                    width = border.frame.size.width;
                    margin = border.frame.origin.y;
                    break;
                    
                default:
                    width = [self devicePixelSize];
                    margin = 0;
            }
            [self addBorderWithColor:color andWidth:width withMargin:margin atPosition:pos.unsignedIntegerValue];
        }
    }
}

#pragma mark - helper

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
