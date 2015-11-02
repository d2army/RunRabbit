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
@property (nonatomic,strong) NSMutableArray *observers;

-(id) init;

-(void) startLocationSensing;

-(void) stopLocationSensing;

/*
 * Part of DataSourceDelegate protocol
 */
-(void) initializeData:(NSDictionary *)dataPacket;

-(void) startUpdatingData;

-(void) stopUpdatingData;

-(void) addObserver:(id)delegate;

-(NSString *) getUnitOfMeasurement;

-(NSString *) getTypeTitle;

@end
