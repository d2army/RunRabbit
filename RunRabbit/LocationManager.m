//
//  LocationManager.m
//  RunRabbit
//
//  Created by Ian Yap on 10/20/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "LocationManager.h"

@implementation LocationManager
@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize altitude = _altitude;
@synthesize speed = _speed;
@synthesize delegate = _delegate;
@synthesize locationManager = _locationManager;


-(void) initDelegateObject:(id)delegate {
    _delegate = delegate;
    
    _locationManager = [[CLLocationManager alloc]init]; // initializing locationManager
    _locationManager.delegate = self; // we set the delegate of locationManager to self.
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest; // setting the accuracy
}


-(void) startLocationSensing {
    [_locationManager startUpdatingLocation];  //requesting location updates
}

-(void) stopLocationSensing {
    [_locationManager stopUpdatingLocation];  //requesting location updates
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    /*UIAlertView *errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"There was an error retrieving your location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [errorAlert show];*/
    NSLog(@"Error: %@",error.description);
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *crnLoc = [locations lastObject];
    _latitude = (double)crnLoc.coordinate.latitude;
    _longitude = (double)crnLoc.coordinate.longitude;
    _altitude = (double)crnLoc.altitude;
    _speed = (double)crnLoc.speed;
    
    [self calculateDistanceLeft];
}

/*
 * Here, this function figures out how much distance is left and if there is a new distance value
 */
-(void) calculateDistanceLeft {
    
    
}


-(NSString *) getUnitOfMeasurement {
    return @"mile(s)";
}


@end
