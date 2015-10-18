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
@synthesize unitOfMeasurement = _unitOfMeasurement;

/*
 * Set the value and measurement
 */
- (void) initialize:(double)countdownValue OfType:(NSString *) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger)xCoord withY:(NSInteger)yCoord {
    _countdownValue = countdownValue;
    _unitOfMeasurement = unitOfMeasurement;
    _quantityTypeLabel.text = quantityType;
    
    self.frame = CGRectMake( xCoord, yCoord, self.frame.size.width, self.frame.size.height );
    
    
    [self setupCountdownValue];
}


/*
 * format the value properly
 */
- (void) setupCountdownValue {
    NSString *finalString = [NSString stringWithFormat:@"%g %@",_countdownValue,_unitOfMeasurement];
    
    _amountLeftLabel.text = finalString;
    
    //set up the count down timer
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0
                                       target: self
                                     selector:@selector(onTick:)
                                     userInfo: nil repeats:YES];
    
}

/*
 * Happens on tick
 */
-(void)onTick:(NSTimer *)timer {
    //do something
}

@end

