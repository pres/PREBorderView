//
//  PREBorderViewSampleViewController.m
//  PREBorderViewSample
//
//  Copyright (c) 2013-2019 Paul Steinhilber
//  https://paulsteinhilber.de
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

#import "PREBorderViewSampleViewController.h"
#import "UIView+PREBorderView.h"

@interface PREBorderViewSampleViewController () {
    IBOutlet UIView* sample1;
    IBOutlet UIView* sample2;
    IBOutlet UIView* sample3;
    IBOutlet UIView* sample4;
    IBOutlet UIView* sample5;
    IBOutlet UIView* sample6;
    IBOutlet UIView* sample7;
    IBOutlet UIView* sample8;
    
    IBOutlet NSLayoutConstraint* widthConstraint;
}

@end

@implementation PREBorderViewSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [sample1 addRetinaPixelBorder];
    
    [sample2 addRetinaPixelBorderAtPosition:PREBorderPositionRight];
    [sample2 addRetinaPixelBorderAtPosition:PREBorderPositionTop];
    
    if (@available(iOS 13.0, *)) {
        [sample3 addBorderWithColor:[UIColor separatorColor] andWidth:2 atPosition:PREBorderPositionTop];
        [sample3 addBorderWithColor:[UIColor labelColor] andWidth:2 atPosition:PREBorderPositionBottom];
    } else {
        [sample3 addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionTop];
    }
    
    [sample7 addBorderWithColor:[UIColor redColor] andWidth:5 withMargin:5 atPosition:PREBorderPositionTop];
    [sample7 addBorderWithColor:[UIColor greenColor] andWidth:10 withMargin:10 atPosition:PREBorderPositionBottom];
    
    [sample7 addBorderWithColor:[UIColor greenColor] andWidth:10 withMargin:20 atPosition:PREBorderPositionLeftOutside];
    [sample7 addBorderWithColor:[UIColor greenColor] andWidth:10 withMargin:20 atPosition:PREBorderPositionRightOutside];
    
    [sample8 addBorderWithColor:[UIColor purpleColor] andWidth:5 atPosition:PREBorderPositionTop];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:5 atPosition:PREBorderPositionLeft];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:2 atPosition:PREBorderPositionBottom];
    
    [self performSelector:@selector(addLine) withObject:nil afterDelay:0.5];
    
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionTop];
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionRight];
    if (@available(iOS 13.0, *)) {
        [sample5 addBorderWithColor:[UIColor labelColor] andWidth:10 atPosition:PREBorderPositionBottom];
        [sample5 addBorderWithColor:[UIColor labelColor] andWidth:10 atPosition:PREBorderPositionLeft];
        [sample5 addBorderWithColor:[UIColor labelColor] andWidth:10 atPosition:PREBorderPositionTopOutside];
        [sample5 addBorderWithColor:[UIColor labelColor] andWidth:10 atPosition:PREBorderPositionRightOutside];
    } else {
        [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionBottom];
        [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionLeft];
        [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionTopOutside];
        [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionRightOutside];
    }
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionBottomOutside];
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionLeftOutside];
}

- (void)viewDidLayoutSubviews {
    [self.view layoutSubviewBorders];
}

- (void)traitCollectionDidChange:(UITraitCollection*)previousTraitCollection {
    [self.view layoutSubviewBorders];
}

#pragma mark -

- (void)removeLine {
    [sample1 addRetinaPixelBorder];
    
    widthConstraint.constant = 130;
    
    [sample4 removeBorderAtPosition:PREBorderPositionTop];
    [sample4 removeBorderAtPosition:PREBorderPositionRight];
    [sample4 removeBorderAtPosition:PREBorderPositionBottom];
    [sample4 removeBorderAtPosition:PREBorderPositionLeft];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionLeftOutside];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionBottomOutside];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionRightOutside];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionTopOutside];
    
    [sample6 removeBorderAtPosition:PREBorderPositionTopOutside];
    [sample6 removeBorderAtPosition:PREBorderPositionRightOutside];
    [sample6 removeBorderAtPosition:PREBorderPositionBottomOutside];
    [sample6 removeBorderAtPosition:PREBorderPositionLeftOutside];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:10 atPosition:PREBorderPositionTop];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:20 atPosition:PREBorderPositionRight];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:10 atPosition:PREBorderPositionBottom];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:20 atPosition:PREBorderPositionLeft];
    
    [sample8 removeBorderAtPosition:PREBorderPositionRight];
    [self performSelector:@selector(addLine) withObject:nil afterDelay:0.5];
    
    [self.view layoutSubviewBorders];
}

- (void)addLine {
    [sample1 removeAllBorders];
    
    widthConstraint.constant = 50;
    
    [sample4 removeBorderAtPosition:PREBorderPositionTopOutside];
    [sample4 removeBorderAtPosition:PREBorderPositionRightOutside];
    [sample4 removeBorderAtPosition:PREBorderPositionBottomOutside];
    [sample4 removeBorderAtPosition:PREBorderPositionLeftOutside];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionRight];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionTop];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionBottom];
    [sample4 addBorderWithColor:[UIColor purpleColor] andWidth:10 atPosition:PREBorderPositionLeft];
    
    [sample6 removeBorderAtPosition:PREBorderPositionTop];
    [sample6 removeBorderAtPosition:PREBorderPositionRight];
    [sample6 removeBorderAtPosition:PREBorderPositionBottom];
    [sample6 removeBorderAtPosition:PREBorderPositionLeft];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:10 atPosition:PREBorderPositionTopOutside];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:10 atPosition:PREBorderPositionBottomOutside];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:20 atPosition:PREBorderPositionRightOutside];
    [sample6 addBorderWithColor:[UIColor cyanColor] andWidth:20 atPosition:PREBorderPositionLeftOutside];
    
    [sample8 addBorderWithColor:[UIColor orangeColor] andWidth:8 atPosition:PREBorderPositionRight];
    [self performSelector:@selector(removeLine) withObject:nil afterDelay:0.5];
    
    [self.view layoutSubviewBorders];
}

@end
