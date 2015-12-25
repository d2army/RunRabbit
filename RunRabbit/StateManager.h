//
//  StateManager.h
//  RunRabbit
//
//  Created by Ian Yap on 11/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StateTypeDefinition.h"
#import "EventDataTypeDefinition.h"
#import "StateSourceDelegate.h"
#import "DataTargetDelegate.h"

@interface StateManager : NSObject  <StateSourceDelegate,DataTargetDelegate>
@property (nonatomic) StateType currentState;

//Observers collects all the state observers
//it is a map of event types mapped to arrays of listeners
@property (nonatomic,strong) NSMutableArray *eventMap;

-(void) updateValue:(id)value forEventType:(EventDataType) eventType;

-(void) addObserver:(id)delegate forDataType:(EventDataType)dataType;

@end
