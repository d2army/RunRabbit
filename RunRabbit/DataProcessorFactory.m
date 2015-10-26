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


+ (id)createDataProcessorByMeasurementType:(DataProcessorType)type {
    switch (type) {
        case NSDistanceType:
            LocationManager *item = [[LocationManager alloc] init];
            
            return item;
        break;
            
        default:
            
            return nil;
            break;
            
    }
    
}
@end
