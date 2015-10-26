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
    
    [self setupDataProcessor:self];
}


- (void) setupDataProcessor:(CountdownView *)view {
    
    
}


-(void) setCountdownValue:(double)countdownValue {
    NSString *finalString = [NSString stringWithFormat:@"%g %@",countdownValue,_unitOfMeasurement];
    
    _amountLeftLabel.text = finalString;
}


-(void) setPRogressBarValue:(double) countdownValue {
    //set progress bar
    _progressBar.progress = (countdownValue/_countdownMax) * 1.0;
}
@end

