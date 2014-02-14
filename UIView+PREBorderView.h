//
//  UIView+PREBorderView.h
//  PREBorderViewSample
//
//  Created by Paul Steinhilber on 14.02.2014.
//  Copyright (c) 2014 Paul Steinhilber. All rights reserved.
//

#import <UIKit/UIKit.h>

enum PREBorderPosition {
    PREBorderPositionTop,
    PREBorderPositionBottom,
    PREBorderPositionLeft,
    PREBorderPositionRight
};

@interface UIView (PREBorderView)

- (void)addOneRetinaPixelBorder;
- (void)addOneRetinaPixelBorderWithColor:(UIColor*)color;
- (void)addOneRetinaPixelLineAtPosistion:(enum PREBorderPosition)position;
- (void)addOneRetinaPixelLineWithColor:(UIColor*)color atPosistion:(enum PREBorderPosition)position;

@end
