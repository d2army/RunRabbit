//
//  StateManager.m
//  RunRabbit
//
//  Created by Ian Yap on 11/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "StateManager.h"

@implementation StateManager
@synthesize currentState = _currentState;
@synthesize eventMap = _eventMap;


- (void) initStateMachine {
    _currentState = NOT_STARTED_STATE;
    
    //initialize eventMap properly with the event states
    [EventDataTypeDefinition initializeEventDataTypeMap:_eventMap];
    
}

//called when adding an observer for a specific data type
-(void) addObserver:(id)delegate forDataType:(EventDataType)dataType {
    //get the item from the map
    NSMutableArray *observers = [_eventMap objectForKey:[NSString stringWithFormat: @"%ld", (long)dataType]];
    
    [observers addObject:delegate];
}


-(void) updateValue:(id)value forEventType:(EventDataType) eventType {
    
    //depending on what the current state is,
    //send out the updates accordingly
    
    switch (eventType) {
        case TIME_TYPE:
        case SPEED_TYPE:
        case DISTANCE_TYPE: {
            
            NSMutableArray *observers = [_eventMap objectForKey:[NSString stringWithFormat: @"%ld", (long)eventType]];
            [self sendDataUpdate:value toObservers:observers];
            
            break;
        }
        default:
            break;
    }
    
    [self executeGivenCurrentState:(EventDataType) eventType];
    
}


//Need to send data to appropriate state subscribers
-(void) sendDataUpdate:(id)value toObservers:(NSMutableArray *)observers {
    for (id observer in observers) {
        [observer updateValue:value];
    }
}



//Also need to send state updates to all subscribers
-(void) sendStateUpdate:(StateType)state {
    for (id eventType in _eventMap) {
        NSMutableArray *observers = [_eventMap objectForKey:[NSString stringWithFormat: @"%ld", (long)eventType]];
        
        for (id observer in observers) {
            [observer updateState:state];
        }
        
    }
}


/*
 * Given the current state, what to do at this time
 */
-(void) executeGivenCurrentState:(EventDataType) eventType {
    switch (_currentState) {
        case NOT_STARTED_STATE:
            break;
            
        case RUNNING_STATE:
            //transmit all data
            
            break;
            
        case COMPLETED_STATE:
            break;
    }
    
}

-(void) startUpdatingState;

@end
