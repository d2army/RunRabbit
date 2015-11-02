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
@property (nonatomic) double countdownMax;
@property (nonatomic,strong) NSMutableArray *observers;

-(id) init;

/*
 * Part of DataSourceDelegate protocol
 */
-(void) initializeData:(NSDictionary *)dataPacket;

-(void) startUpdatingData;

-(void) stopUpdatingData;

-(void) addObserver:(id)delegate;

-(NSString *) getUnitOfMeasurement;

-(NSString *) getTypeTitle;

-(double) getMax;

@end
