//
//  PREViewController.m
//  PREBorderViewSample
//
//  Created by Paul Steinhilber on 14.02.2014.
//  Copyright (c) 2014 Paul Steinhilber. All rights reserved.
//

#import "PREViewController.h"
#import "UIView+PREBorderView.h"

@interface PREViewController () {
    IBOutlet UIView* sample1;
    IBOutlet UIView* sample2;
    IBOutlet UIView* sample3;
    IBOutlet UIView* sample4;
    IBOutlet UIView* sample5;
    IBOutlet UIView* sample6;
    IBOutlet UIView* sample7;
    IBOutlet UIView* sample8;
}

@end

@implementation PREViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [sample1 addRetinaPixelBorder];
    [sample2 addRetinaPixelBorderWithColor:[UIColor grayColor]];
    [sample3 addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionTop];
    [sample4 addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionBottom];
    
    [sample7 addBorderWithColor:[UIColor redColor] andWidth:5 atPosition:PREBorderPositionTop];
    [sample7 addBorderWithColor:[UIColor greenColor] andWidth:10 atPosition:PREBorderPositionBottom];
    
    [sample8 addBorderWithColor:[UIColor purpleColor] andWidth:5 atPosition:PREBorderPositionTop];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:5 atPosition:PREBorderPositionLeft];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:2 atPosition:PREBorderPositionBottom];

    [self performSelector:@selector(addLine) withObject:nil afterDelay:0.5];
    
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionTop];
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionRight];
    [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionBottom];
    [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionLeft];
    [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionTopOutside];
    [sample5 addBorderWithColor:[UIColor blackColor] andWidth:10 atPosition:PREBorderPositionRightOutside];
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionBottomOutside];
    [sample5 addBorderWithColor:[UIColor yellowColor] andWidth:10 atPosition:PREBorderPositionLeftOutside];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)removeLine {
    
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
}

- (void)addLine {
    
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
}

@end
