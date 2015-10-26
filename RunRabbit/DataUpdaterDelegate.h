//
//  DataUpdater.h
//  RunRabbit
//
//  Created by Ian Yap on 10/22/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataUpdaterDelegate

-(void) setCountdownValue:(double)countdownValue;
-(void) setProgressBarValue:(double) countdownValue;

@end
