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
@property (nonatomic,strong) NSMutableArray *observers;

-(void) updateValue:(id)value forEventType:(EventDataType) eventType;

@end
