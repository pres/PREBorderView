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
    [sample2 addOneRetinaPixelBorderWithColor:[UIColor grayColor]];
    [sample3 addLineWithColor:[UIColor blackColor] andWidth:2 atPosistion:PREBorderPositionTop];
    [sample4 addLineWithColor:[UIColor blackColor] andWidth:2 atPosistion:PREBorderPositionBottom];
    [sample5 addLineWithColor:[UIColor blackColor] andWidth:2 atPosistion:PREBorderPositionLeft];
    [sample6 addLineWithColor:[UIColor blackColor] andWidth:2 atPosistion:PREBorderPositionRight];
    
    [sample7 addLineWithColor:[UIColor redColor] andWidth:5 atPosistion:PREBorderPositionTop];
    [sample7 addLineWithColor:[UIColor greenColor] andWidth:10 atPosistion:PREBorderPositionBottom];
    
    [sample8 addLineWithColor:[UIColor purpleColor] andWidth:5 atPosistion:PREBorderPositionTop];
    [sample8 addLineWithColor:[UIColor magentaColor] andWidth:5 atPosistion:PREBorderPositionLeft];
    [sample8 addLineWithColor:[UIColor magentaColor] andWidth:2 atPosistion:PREBorderPositionBottom];
    [sample8 addLineWithColor:[UIColor purpleColor] andWidth:2 atPosistion:PREBorderPositionRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
