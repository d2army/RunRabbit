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
@synthesize timerManager = _timerManager;
@synthesize locationManager = _locationManager;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    //Set up the time and distance labels
    [self setupTimeDisplay];
    
    [self setupDistanceDisplay];
    
}


- (void) setupTimeDisplay {
    //Set up timer manager
    NSDictionary *initialDataPacket = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       [[NSNumber numberWithDouble:_timeLeft] stringValue], @"Countdown_Value",
                                       [[NSNumber numberWithDouble:_timeLeft] stringValue], @"Countdown_Max",
                                       nil];
    CountdownView *timeView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    
    _timerManager = [DataProcessorFactory createDataProcessorByMeasurementType:NSTimeType withDelegate:timeView withInitialDataPacket:initialDataPacket];
    [timeView initializeWithDataProcessor:_timerManager withX:18 withY:115];
    
    [self.view addSubview:timeView];
    
}


- (void) setupDistanceDisplay {
    //location
    NSDictionary *initialDataPacket = [[NSDictionary alloc] initWithObjectsAndKeys:
                         [[NSNumber numberWithDouble:_distanceLeft] stringValue], @"Countdown_Value",
                         [[NSNumber numberWithDouble:_distanceLeft] stringValue], @"Countdown_Max",
                         nil];
    
    CountdownView *distanceView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    
    _locationManager = [DataProcessorFactory createDataProcessorByMeasurementType:NSDistanceType withDelegate:distanceView withInitialDataPacket:initialDataPacket];
    
    [distanceView initializeWithDataProcessor:_locationManager withX:18 withY:384];
    
    
    //add views to house
    [self.view addSubview:distanceView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
