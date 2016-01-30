//
// UIView+PREBorderView.h
//
// Copyright (c) 2013-16 Paul Steinhilber (http://paulsteinhilber.de)
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

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, PREBorderPosition) {
    PREBorderPositionTop,
    PREBorderPositionBottom,
    PREBorderPositionLeft,
    PREBorderPositionRight,
    PREBorderPositionTopOutside,
    PREBorderPositionBottomOutside,
    PREBorderPositionLeftOutside,
    PREBorderPositionRightOutside
};

@interface UIView (PREBorderView)

/// default color to use for borders that don't specify a color.
@property (nonatomic,retain) UIColor* defaultBorderColor;
/// the size of a device pixel
@property (nonatomic,readonly) CGFloat devicePixelSize;

/**
 *  Add a border to a view with the line width of one retina pixel.
 */
- (void)addRetinaPixelBorder;

/**
 *  Add a border to a view with the line width of one retina pixel with the specified color.
 *
 *  @param color color of the line
 */
- (void)addRetinaPixelBorderWithColor:(UIColor*)color;

/**
 *  Add a border to a view with the specified line width and the specified color.
 *
 *  @param color color of the line
 *  @param lineWidth the width of the line in logical px. Use @c devicePixelSize to get a single retina/device pixel line.
 */
- (void)addBorderWithColor:(UIColor*)color andWidth:(float)lineWidth;

/**
 *  Add a single retina pixel line to the specified side of the view.
 *
 *  @param position the side of the view to which the line should be added
 */
- (void)addRetinaPixelBorderAtPosition:(PREBorderPosition)position;

/**
 *  Add a single retina pixel line to the specified side of the view with the specified color.
 *
 *  @param color color of the line
 *  @param position the side of the view to which the line should be added
 */
- (void)addRetinaPixelBorderWithColor:(UIColor*)color atPosition:(PREBorderPosition)position;

/**
 *  Add a line to the specified side of the view with the specified line width.
 *
 *  @param lineWidth the width of the line in logical px. Use @c devicePixelSize to get a single retina/device pixel line.
 *  @param position the side of the view to which the line should be added
 */
- (void)addBorderWithWidth:(float)lineWidth atPosition:(PREBorderPosition)position;

/**
 *  Add a line to the specified side of the view with the specified color and the specified line width.
 *
 *  @param color color of the line
 *  @param lineWidth the width of the line in logical px. Use @c devicePixelSize to get a single retina/device pixel line.
 *  @param position the side of the view to which the line should be added
 */
- (void)addBorderWithColor:(UIColor*)color andWidth:(float)lineWidth atPosition:(PREBorderPosition)position;

/**
 *  Returns the layer of the border at the specified position
 */
- (CALayer*)borderAtPosition:(PREBorderPosition)position;

/**
 *  Remove the line at the specified side of the view.
 *
 *  @param position the side of the view from which lines should be removed
 */
- (void)removeBorderAtPosition:(PREBorderPosition)position;

/**
 *  Remove the lines from all sides of the view.
 */
- (void)removeAllBorders;

@end
