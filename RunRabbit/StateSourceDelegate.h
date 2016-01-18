//
//  DataSourceDelegate.h
//  RunRabbit
//
//  Created by Ian Yap on 10/31/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataProcessorFactory.h"
#import "StateTypeDefinition.h"

@protocol StateSourceDelegate

@required

-(void) startUpdatingState;

-(void) stopUpdatingState;

/*
 * Set up initial data
 */
-(void) initializeData:(NSDictionary *)dataPacket;

/*
 * Adding an observing delegate for the state
 */
-(void) addObserver:(id)delegate;


@end
