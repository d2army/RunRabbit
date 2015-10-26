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


+ (id)createDataProcessorByMeasurementType:(DataProcessorType)type withDelegate:(id) delegate {
    if (type == NSDistanceType) {
            
    LocationManager *item = [[LocationManager alloc] init];
        [item initialize:delegate];
        
            
            return item;
    } else if (type == NSTimeType) {
        TimerManager * item = [[TimerManager alloc] init];
        [item initialize:delegate];
        
        return item;
    } else {
    
            return nil;
    }
}
@end
