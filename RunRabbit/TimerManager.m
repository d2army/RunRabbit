//
//  TimerManager.m
//  RunRabbit
//
//  Created by Ian Yap on 10/21/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "TimerManager.h"

@implementation TimerManager
@synthesize countdownTimer = _countdownTimer;
@synthesize countdownValue = _countdownValue;
@synthesize countdownMax = _countdownMax;
@synthesize observers = _observers;


-(id) init {
    self = [super init];
    if (!self) return nil;
    
    _observers = [[NSMutableArray alloc] init];
    return self;
}


-(void) addObserver:(id)delegate forDataType:(EventDataType)dataType {
    [_observers addObject:delegate];
}

-(void) notifyObserversOfNewEvent:(double)countdownValue {
    for (id observer in _observers) {
        [observer updateValue:[NSNumber numberWithDouble:countdownValue]];
    }
}

-(void) notifyObserversCompletion {
    for (id observer in _observers) {
        [observer completedUpdate];
    }
}

-(void) initializeData:(NSDictionary *)dataPacket {
    _countdownMax = [[dataPacket valueForKey:@"Countdown_Max"] doubleValue];
    _countdownValue = [[dataPacket valueForKey:@"Countdown_Value"] doubleValue];
}

-(void) startUpdatingData {
    [self setupCounter];
}

-(void) stopUpdatingData {
    [_countdownTimer invalidate];
    _countdownTimer = nil;
}

/*
 * format the value properly
 */
- (void) setupCounter {
    //set up the count down timer
    _countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                                       target: self
                                                     selector:@selector(onTick:)
                                                     userInfo: nil repeats:YES];
    
}

/*
 * Happens on tick
 */
-(void) onTick:(NSTimer *)timer {
    if (_countdownValue > 0) {
        //update the countdown
        _countdownValue -= 1.0;
        [self notifyObserversOfNewEvent:_countdownValue];
    } else {
        //stop timer
        [_countdownTimer invalidate];
        _countdownTimer = nil;
        [self notifyObserversCompletion];
    }
}

-(NSString *) getUnitOfMeasurement {
    return @"s";
}


-(NSString *) getTypeTitle {
    return @"Time";
}

-(NSString *) getFormatForDisplay {
    return @"%g %@";
}

-(double) getMax {
    return _countdownMax;
}

@end
