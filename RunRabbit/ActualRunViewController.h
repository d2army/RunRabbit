//
//  ActualRunViewController.h
//  RunRabbit
//
//  Created by Ian Yap on 8/28/15.
//  Copyright (c) 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountdownView.h"
#import "TimerManager.h"
#import "LocationManager.h"

@interface ActualRunViewController : UIViewController

@property (nonatomic) double distanceLeft;
@property (nonatomic) double timeLeft;
@property (nonatomic, strong) TimerManager *timerManager;
@property (nonatomic, strong) LocationManager *locationManager;

@end

