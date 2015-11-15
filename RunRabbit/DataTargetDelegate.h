//
//  DataUpdater.h
//  RunRabbit
//
//  Created by Ian Yap on 10/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataTargetDelegate

@required

-(void) updateValue:(id)value;

/*
 * Inform target updating of data has ended
 */
-(void) completedUpdate;

@optional



@end
