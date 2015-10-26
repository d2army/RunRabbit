//
//  TimerManager.h
//  RunRabbit
//
//  Created by Ian Yap on 10/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataUpdaterDelegate.h"

@interface TimerManager : NSObject

@property (nonatomic,strong) NSTimer *countdownTimer;
@property (nonatomic) double countdownValue;
@property (weak) id <DataUpdaterDelegate> view;

-(void) setViewObject:(id)view;

@end
