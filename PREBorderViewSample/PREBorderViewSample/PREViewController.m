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
    [sample5 addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionLeft];
    [sample6 addBorderWithColor:[UIColor blackColor] andWidth:2 atPosition:PREBorderPositionRight];
    
    [sample7 addBorderWithColor:[UIColor redColor] andWidth:5 atPosition:PREBorderPositionTop];
    [sample7 addBorderWithColor:[UIColor greenColor] andWidth:10 atPosition:PREBorderPositionBottom];
    
    [sample8 addBorderWithColor:[UIColor purpleColor] andWidth:5 atPosition:PREBorderPositionTop];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:5 atPosition:PREBorderPositionLeft];
    [sample8 addBorderWithColor:[UIColor magentaColor] andWidth:2 atPosition:PREBorderPositionBottom];

    [self performSelector:@selector(addLine) withObject:nil afterDelay:0.5];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

#pragma mark -

- (void)removeLine {
    
    [sample8 removeBorderAtPosition:PREBorderPositionRight];
    [self performSelector:@selector(addLine) withObject:nil afterDelay:0.5];
}

- (void)addLine {
    
    [sample8 addBorderWithColor:[UIColor orangeColor] andWidth:8 atPosition:PREBorderPositionRight];
    [self performSelector:@selector(removeLine) withObject:nil afterDelay:0.5];
}

@end
