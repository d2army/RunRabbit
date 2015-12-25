//
//  StateManager.m
//  RunRabbit
//
//  Created by Ian Yap on 11/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "StateManager.h"
#import "EventDataTypeDefinition.h"

@implementation StateManager
@synthesize currentState = _currentState;
@synthesize eventMap = _eventMap;


- (void) initStateMachine {
    _currentState = NOT_STARTED_STATE;
    _eventMap = [[NSMutableArray alloc] init];
}

-(void) updateValue:(id)value forEventType:(EventDataType) eventType {
    
    //depending on what the current state is,
    //send out the updates accordingly
    
    switch (eventType) {
        case TIME_TYPE:
            
        case TIME_COMPLETED:
            //time over, shut everything down
            
            _currentState = COMPLETED_STATE;
            
            break;
            
        case SPEED_TYPE:
        case SPEED_COMPLETED:
            break;
            
        case DISTANCE_TYPE:
        case DISTANCE_COMPLETED:
            break;
        default:
            break;
    }
    
    [self executeGivenCurrentState];
    
}


-(void) executeGivenCurrentState {
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

@end
