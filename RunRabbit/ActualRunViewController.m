//
//  ActualRunViewController.m
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import "ActualRunViewController.h"
#import "DataProcessorFactory.h"

@interface ActualRunViewController ()

@end

@implementation ActualRunViewController
@synthesize distanceLeft = _distanceLeft;
@synthesize timeLeft = _timeLeft;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    //Set up the time and distance labels
    

    CountdownView *timeView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    [timeView initialize:_timeLeft OfType:NSTimeType withMeasurementUnit:@"second(s)" withX:18 withY:115];
    
    CountdownView *distanceView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    [distanceView initialize:_distanceLeft OfType:NSDistanceType withMeasurementUnit:@"mile(s)" withX:18 withY:384];
    
    
    //add views to house
    [self.view addSubview:distanceView];
    
    [self.view addSubview:timeView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
