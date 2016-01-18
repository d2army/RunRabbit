//
//  DataUpdater.h
//  RunRabbit
//
//  Created by Ian Yap on 10/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StateTypeDefinition.h"

@protocol StateTargetDelegate

@required

/*
 * Send the most current state to the delegate
 */
-(void) updateState:(StateTypeDefinition)state;


/*
 * Inform target updating of data has ended for it
 */
-(void) completedUpdate;

@optional



@end
