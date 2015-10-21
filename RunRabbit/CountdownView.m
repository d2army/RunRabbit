//
//  CountdownComponent.m
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "CountdownView.h"

@implementation CountdownView

@synthesize amountLeftLabel = _amountLeftLabel;
@synthesize quantityTypeLabel = _quantityTypeLabel;
@synthesize progressBar = _progressBar;
@synthesize countdownTimer = _countdownTimer;

@synthesize countdownValue = _countdownValue;
@synthesize countdownMax = _countdownMax;
@synthesize unitOfMeasurement = _unitOfMeasurement;

/*
 * Set the value and measurement
 */
- (void) initialize:(double)countdownValue OfType:(NSString *) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger)xCoord withY:(NSInteger)yCoord {
    _countdownValue = countdownValue;
    _countdownMax = countdownValue;
    _unitOfMeasurement = unitOfMeasurement;
    _quantityTypeLabel.text = quantityType;
    _progressBar.progress = 1.0;
    
    self.frame = CGRectMake( xCoord, yCoord, self.frame.size.width, self.frame.size.height );
    
    
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
        [self setCountdownValue];
    } else {
        //stop timer
        [_countdownTimer invalidate];
        _countdownTimer = nil;
    }
    
    //set progress bar
    _progressBar.progress = (_countdownValue/_countdownMax) * 1.0;
    
}


-(void) setCountdownValue {
    NSString *finalString = [NSString stringWithFormat:@"%g %@",_countdownValue,_unitOfMeasurement];
    
    _amountLeftLabel.text = finalString;
}

@end

