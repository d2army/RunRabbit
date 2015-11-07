//
//  ActualRunViewController.m
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import "ActualRunViewController.h"
#import "DataProcessorFactory.h"
#import "NotificationMessage.h"

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
    
    [self setupDistanceDisplayNotificationDisplay];
}


- (void) setupTimeDisplay {
    //Set up timer manager
    NSDictionary *initialDataPacket = [[NSDictionary alloc] initWithObjectsAndKeys:
                                       [[NSNumber numberWithDouble:_timeLeft] stringValue], @"Countdown_Value",
                                       [[NSNumber numberWithDouble:_timeLeft] stringValue], @"Countdown_Max",
                                       nil];
    CountdownView *timeView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    
    _timerManager = [DataProcessorFactory createDataProcessorByMeasurementType:NSTimeType withInitialDataPacket:initialDataPacket];
    [_timerManager addObserver:timeView];
    [timeView initializeWithDataProcessor:_timerManager withX:18 withY:100];
    
    [self.view addSubview:timeView];
    
}


- (void) setupDistanceDisplayNotificationDisplay {
    //location
    NSDictionary *initialDataPacket = [[NSDictionary alloc] initWithObjectsAndKeys:
                         [[NSNumber numberWithDouble:_distanceLeft] stringValue], @"Countdown_Value",
                         [[NSNumber numberWithDouble:_distanceLeft] stringValue], @"Countdown_Max",
                         nil];
    
    CountdownView *distanceView = [[[NSBundle mainBundle] loadNibNamed:@"CountdownView" owner:self options:nil] lastObject];
    
    _locationManager = [DataProcessorFactory createDataProcessorByMeasurementType:NSDistanceType  withInitialDataPacket:initialDataPacket];
    [_locationManager addObserver:distanceView];
    [distanceView initializeWithDataProcessor:_locationManager withX:18 withY:200];
    
    
    //add views to house
    [self.view addSubview:distanceView];
    
    NotificationMessage * notificationMessage = [[NotificationMessage alloc] initWithFrame:CGRectMake(0,500,CGRectGetWidth(self.view.frame),50)];

    [self.view addSubview:notificationMessage];
    
    [_locationManager addObserver:notificationMessage];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
