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
@synthesize dataProcessor = _dataProcessor;


/*
 * Set the value and measurement
 */
- (void) initialize:(double)countdownValue OfType:(DataProcessorType) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger)xCoord withY:(NSInteger)yCoord {
    _countdownValue = countdownValue;
    _countdownMax = countdownValue;
    _unitOfMeasurement = unitOfMeasurement;

    _progressBar.progress = 1.0;
    
    self.frame = CGRectMake( xCoord, yCoord, self.frame.size.width, self.frame.size.height );
    
    /*
     * Initial data
     */
    NSDictionary *initialDataPacket = [[NSDictionary alloc] initWithObjectsAndKeys:
                                            [[NSNumber numberWithDouble:_countdownValue] stringValue], @"Countdown_Value",
                                            [[NSNumber numberWithDouble:_countdownValue] stringValue], @"Countdown_Max",
                                            nil];
    
    _dataProcessor = [DataProcessorFactory createDataProcessorByMeasurementType:quantityType withDelegate:self withInitialDataPacket:initialDataPacket];
    
    _quantityTypeLabel.text = [_dataProcessor getTypeTitle];
    
    [_dataProcessor startUpdatingData];
}




-(void) updateValue:(id)value {
    _amountLeftLabel.text = [NSString stringWithFormat:@"%g %@",[value doubleValue],_unitOfMeasurement];
}

-(void) completedUpdate {
    _amountLeftLabel.text = @"Completed!";
}

-(void) setProgressBarValue:(double) countdownValue {
    //set progress bar
    _progressBar.progress = (countdownValue/_countdownMax) * 1.0;
}
@end

