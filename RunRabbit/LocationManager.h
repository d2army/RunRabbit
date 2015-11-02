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

@property (nonatomic) double distanceSoFar;
@property (nonatomic, strong) CLLocation *prevLocation;
@property (nonatomic, strong) CLLocation *curLocation;

@property (nonatomic) double countdownMax;
@property (nonatomic) double countdownValue;

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSMutableArray *observers;

-(id) init;

/*
 * Part of CLLocationManagerDelegate
 */

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations;

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;

-(void)didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;


/*
 * Part of DataSourceDelegate protocol
 */
-(void) initializeData:(NSDictionary *)dataPacket;

-(void) startUpdatingData;

-(void) stopUpdatingData;

-(void) addObserver:(id)delegate;

-(NSString *) getUnitOfMeasurement;

-(NSString *) getTypeTitle;

-(double) getMax;

@end
