//
//  LocationManager.h
//  RunRabbit
//
//  Created by Ian Yap on 10/20/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "DataTargetDelegate.h"
#import "DataSourceDelegate.h"

@interface LocationManager : NSObject <CLLocationManagerDelegate,DataSourceDelegate>

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) double altitude;
@property (nonatomic) double speed;
@property CLLocationManager *locationManager;
@property (weak) id <DataTargetDelegate> delegate;

-(void) initDelegateObject:(id)delegate;

-(void) startLocationSensing;

-(void) stopLocationSensing;

-(NSString *) getUnitOfMeasurement;

@end
