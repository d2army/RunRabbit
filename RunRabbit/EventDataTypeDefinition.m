//
//  EventDataTypeDefinition.m
//  RunRabbit
//
//  Created by Ian Yap on 11/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "EventDataTypeDefinition.h"

@implementation EventDataTypeDefinition

/*
 * initializing the map
 */
+(void) initializeEventDataTypeMap:(NSMutableDictionary *) map {
    map = [[NSMutableDictionary alloc] init];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)DISTANCE_TYPE]];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)DISTANCE_COMPLETED]];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)TIME_TYPE]];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)TIME_COMPLETED]];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)SPEED_TYPE]];
    [map setValue:[[NSMutableArray alloc] init]  forKey:[NSString stringWithFormat: @"%ld", (long)SPEED_COMPLETED]];
}

@end
