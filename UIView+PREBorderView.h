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

@property (nonatomic,retain) UIColor* defaultBorderColor;

- (void)addOneRetinaPixelBorder;
- (void)addOneRetinaPixelBorderWithColor:(UIColor*)color;

- (void)addOneRetinaPixelLineAtPosition:(enum PREBorderPosition)position;
- (void)addOneRetinaPixelLineWithColor:(UIColor*)color atPosition:(enum PREBorderPosition)position;

- (void)addLineWithWidth:(float)pixelWidth atPosition:(enum PREBorderPosition)position;
- (void)addLineWithColor:(UIColor*)color andWidth:(float)pixelWidth atPosition:(enum PREBorderPosition)position;

- (void)removeBorderAtPosition:(enum PREBorderPosition)position;
- (void)removeAllBorders;

@end
