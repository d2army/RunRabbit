//
//  LocationManager.m
//  RunRabbit
//
//  Created by Ian Yap on 10/20/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "LocationManager.h"

#import "ObserverComponent.h"

@implementation LocationManager
@synthesize curLocation = _curLocation;
@synthesize prevLocation = _prevLocation;
@synthesize observers = _observers;
@synthesize locationManager = _locationManager;
@synthesize countdownValue = _countdownValue;
@synthesize countdownMax = _countdownMax;



-(id) init {
    self = [super init];
    if (!self) return nil;
    
    _observers = [[NSMutableArray alloc] init];
    _prevLocation = nil;
    
    return self;
}

-(void) startUpdatingData {
    _locationManager = [[CLLocationManager alloc] init]; // initializing locationManager
    _locationManager.delegate = self; // we set the delegate of locationManager to self.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
    
    [self startLocationSensing];
}

-(void) stopUpdatingData {
    [self stopLocationSensing];
    _prevLocation = nil;
}

-(void) initializeData:(NSDictionary *)dataPacket{
    _countdownMax = [[dataPacket valueForKey:@"Countdown_Max"] doubleValue];
    _countdownValue = [[dataPacket valueForKey:@"Countdown_Value"] doubleValue];
}

-(void) addObserver:(id)delegate forDataType:(DataProcessorType)dataType {

    ObserverComponent *observerComponent = [[ObserverComponent alloc] init];
    observerComponent.delegate = delegate;
    observerComponent.dataType = dataType;
    
    [_observers addObject:observerComponent];
}

-(void) notifyObserversOfNewEvent:(LocationDataPacket *)packet {
    for (ObserverComponent *observerComponent in _observers) {
        if (observerComponent.dataType == NSDistanceType) {
            [observerComponent.delegate updateValue:[NSNumber numberWithDouble:packet.distanceLeft]];
        } else {
            [observerComponent.delegate updateValue:[NSNumber numberWithDouble:packet.speed]];
        }
    }
}

-(void) notifyObserversCompletion {
    for (ObserverComponent *observerComponent in _observers) {
        [observerComponent.delegate completedUpdate];
    }
}

-(void) startLocationSensing {
    
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
        //[_locationManager startUpdatingLocation];
    } else {
        [_locationManager startUpdatingLocation];
    }
}

-(void) stopLocationSensing {
    [_locationManager stopUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager startUpdatingLocation];
    }
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    /*UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];*/
    NSLog(@"Error: %@",error.description);
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    _curLocation = [locations lastObject];

    
    //if this is the first data point, no calculation
    if (_prevLocation != nil) {
            [self processNewLocation];
    }
    _prevLocation = _curLocation;
}


- (void)didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"Got caught in old < IOS 6");
}

/*
 * Here, this function figures out how much distance is left and if there is a new distance value
 */
-(void) processNewLocation {
    //NSLog(@"Running at speed : %f m/s" , _speed);
    double incrementalDistanceIncreaseMiles = [_curLocation distanceFromLocation:_prevLocation] * 0.00062137;
    _countdownValue -= incrementalDistanceIncreaseMiles;
    
    if (_countdownValue  > 0.0) {
        //let observers know
        
        //update packet
        LocationDataPacket *packet = [[LocationDataPacket alloc] init];
        packet.distanceLeft = _countdownValue;
        packet.speed = _curLocation.speed;
        
        [self notifyObserversOfNewEvent:packet];
    } else {
        //stop location
        [self stopLocationSensing];
        [self notifyObserversCompletion];
    }
}


-(NSString *) getUnitOfMeasurement {
    return @"mile(s)";
}

-(NSString *) getTypeTitle {
    return @"Distance";
}

-(NSString *) getFormatForDisplay {
    return @"%.02g %@";
}

-(double) getMax {
    return _countdownMax;
}
@end
