//
//  DataUpdater.h
//  RunRabbit
//
//  Created by Ian Yap on 10/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventDataTypeDefinition.h"

@protocol DataTargetDelegate <NSObject>

@required

-(void) updateValue:(id)value forEventType:(EventDataType) eventType;

/*
 * Inform target updating of data has ended
 */
-(void) completedUpdateForEventType:(EventDataType) eventType;

@optional



@end
