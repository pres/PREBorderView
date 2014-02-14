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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [sample1 addOneRetinaPixelBorder];
    [sample2 addOneRetinaPixelBorderWithColor:[UIColor purpleColor]];
    [sample3 addOneRetinaPixelLineWithColor:[UIColor blackColor] atPosistion:PREBorderPositionTop];
    [sample4 addOneRetinaPixelLineWithColor:[UIColor blackColor] atPosistion:PREBorderPositionBottom];
    [sample5 addOneRetinaPixelLineWithColor:[UIColor blackColor] atPosistion:PREBorderPositionLeft];
    [sample6 addOneRetinaPixelLineWithColor:[UIColor blackColor] atPosistion:PREBorderPositionRight];
    
    [sample7 addOneRetinaPixelLineWithColor:[UIColor redColor] atPosistion:PREBorderPositionTop];
    [sample7 addOneRetinaPixelLineWithColor:[UIColor greenColor] atPosistion:PREBorderPositionBottom];
    
    [sample8 addOneRetinaPixelLineWithColor:[UIColor purpleColor] atPosistion:PREBorderPositionLeft];
    [sample8 addOneRetinaPixelLineWithColor:[UIColor purpleColor] atPosistion:PREBorderPositionRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
