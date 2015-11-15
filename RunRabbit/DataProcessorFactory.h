//
//  DataProcessorFactory.h
//  RunRabbit
//
//  Created by Ian Yap on 10/25/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataProcessorFactory : NSObject
enum {
    NSDistanceType = 1,
    NSTimeType = 2,
    NSSpeedType = 3
};
typedef NSInteger DataProcessorType;

+ (id)createDataProcessorByMeasurementType:(DataProcessorType)type withInitialDataPacket:(NSDictionary *) initialDataPacket;


@end
