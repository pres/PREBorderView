//
//  UIView+PREBorderView.m
//  PREBorderViewSample
//
//  Created by Paul Steinhilber on 30.06.2013.
//  Copyright (c) 2013 Paul Steinhilber. All rights reserved.
//

#import "UIView+PREBorderView.h"

@implementation UIView (PREBorderView)

- (void)addOneRetinaPixelBorder {
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithWhite:0.1 alpha:0.3].CGColor;
}

- (void)addOneRetinaPixelBorderWithColor:(UIColor*)color {
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = color.CGColor;
}

- (void)addOneRetinaPixelLineAtPosistion:(enum PREBorderPosition)position {
    [self addOneRetinaPixelLineWithColor:[UIColor colorWithWhite:0.1 alpha:0.3] atPosistion:position];
}

- (void)addOneRetinaPixelLineWithColor:(UIColor*)color atPosistion:(enum PREBorderPosition)position {
    CALayer *border = [CALayer layer];
    
    switch (position) {
        case PREBorderPositionTop:
            border.frame = CGRectMake(0, 0, self.frame.size.width, 0.5);
            break;
            
        case PREBorderPositionBottom:
            border.frame = CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5);
            break;
            
        case PREBorderPositionLeft:
            border.frame = CGRectMake(0, 0, 0.5, self.frame.size.height);
            break;
            
        case PREBorderPositionRight:
            border.frame = CGRectMake(self.frame.size.width-0.5, 0, 0.5, self.frame.size.height);
            break;
    }
    
    border.backgroundColor = color.CGColor;
    [self.layer addSublayer:border];
}

@end
