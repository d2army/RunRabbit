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
@synthesize observers = _observers;


-(id) init {
    self = [super init];
    if (!self) return nil;
    
    _observers = [[NSMutableArray alloc] init];
    
    return self;
}



-(void) addObserver:(id)delegate {
    [_observers addObject:delegate];

}

-(void) notifyObservers:(double)countdownValue {
    for (id observer in _observers) {
        [observer updateValue:countdownValue];
    }
}

-(void) starUpdatingData {
    [self setupCounter];
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
        [self notifyObservers:_countdownValue];
    } else {
        //stop timer
        [_countdownTimer invalidate];
        _countdownTimer = nil;
    }
}

-(NSString *) getUnitOfMeasurement {
    return @"second(s)";
}


-(NSString *) getTypeTitle {
    return @"Time";
}


@end
