//
//  TimerManager.h
//  RunRabbit
//
//  Created by Ian Yap on 10/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataTargetDelegate.h"
#import "DataSourceDelegate.h"

@interface TimerManager : NSObject <DataSourceDelegate>

@property (nonatomic,strong) NSTimer *countdownTimer;
@property (nonatomic) double countdownValue;
@property (weak) id <DataTargetDelegate> delegate;

-(void) initDelegateObject:(id)delegate;

-(NSString *) getUnitOfMeasurement;

@end
