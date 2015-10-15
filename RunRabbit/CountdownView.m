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

@synthesize countdownValue = _countdownValue;
@synthesize unitOfMeasurement = _unitOfMeasurement;

/*
 * Set the value and measurement
 */
- (void) initialize:(double)countdownValue OfType:(NSString *) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement {
    _countdownValue = countdownValue;
    _unitOfMeasurement = unitOfMeasurement;
    _quantityTypeLabel.text = quantityType;
    
    
    [self setupCountdownValue];
    
    //set up the count down timer
}


/*
 * format the value properly
 */
- (void) setupCountdownValue {
    NSString *finalString = [NSString stringWithFormat:@"%f %@",_countdownValue,_unitOfMeasurement];
    
    _amountLeftLabel.text = finalString;
}

@end

