//
//  LocationManager.h
//  RunRabbit
//
//  Created by Ian Yap on 10/20/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "DataUpdaterDelegate.h"

@interface LocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) double altitude;
@property (nonatomic) double speed;
@property CLLocationManager *locationManager;
@property (weak) id <DataUpdaterDelegate> delegateObject;


-(void) initialize:(NSObject *) delegate;

-(void) startLocationSensing;

-(void) stopLocationSensing;

@end
