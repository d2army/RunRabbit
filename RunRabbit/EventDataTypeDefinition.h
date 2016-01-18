//
//  EventDataTypeDefinition.h
//  RunRabbit
//
//  Created by Ian Yap on 11/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventDataTypeDefinition : NSObject

enum {
    DISTANCE_TYPE = 1,
    DISTANCE_COMPLETED = 2,
    TIME_TYPE = 3,
    TIME_COMPLETED = 4,
    SPEED_TYPE = 5,
    SPEED_COMPLETED = 6
};
typedef NSInteger EventDataType;

+(void) initializeEventDataTypeMap:(NSMutableDictionary *) map;

@end
