//
//  DataProcessorFactory.h
//  RunRabbit
//
//  Created by Ian Yap on 10/25/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StateTypeDefinition.h"
#import "EventDataTypeDefinition.h"

@interface DataProcessorFactory : NSObject
+ (id)createDataProcessorByMeasurementType:(EventDataType)type withInitialDataPacket:(NSDictionary *) initialDataPacket;

@end
