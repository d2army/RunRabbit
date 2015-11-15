//
//  DataProcessorFactory.m
//  RunRabbit
//
//  Created by Ian Yap on 10/25/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "DataProcessorFactory.h"
#import "LocationManager.h"
#import "TimerManager.h"

@implementation DataProcessorFactory

+ (id)createDataProcessorByMeasurementType:(DataProcessorType)type withInitialDataPacket:(NSDictionary *) initialDataPacket{
    
    if (type == NSDistanceType) {
            
        LocationManager *manager = [[LocationManager alloc] init];
        [manager initializeData:initialDataPacket];
        
        return manager;
    } else if (type == NSSpeedType) {
        
        LocationManager *manager = [[LocationManager alloc] init];
        [manager initializeData:initialDataPacket];
        
        return manager;
    } else if (type == NSTimeType) {
        
        TimerManager * manager = [[TimerManager alloc] init];
        [manager initializeData:initialDataPacket];
        
        return manager;
    } else {
        return nil;
    }
}
@end
