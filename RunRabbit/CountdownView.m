//
//  CountdownComponent.m
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "CountdownView.h"
#import "LocationDataPacket.h"

@implementation CountdownView

@synthesize amountLeftLabel = _amountLeftLabel;
@synthesize quantityTypeLabel = _quantityTypeLabel;
@synthesize progressBar = _progressBar;
@synthesize dataProcessor = _dataProcessor;


/*
 * Set the value and measurement
 */
- (void) initializeWithDataProcessor:(id)dataProcessor withX:(NSInteger)xCoord withY:(NSInteger)yCoord {
    _progressBar.progress = 1.0;
    
    self.frame = CGRectMake( xCoord, yCoord, self.frame.size.width, self.frame.size.height );
    
    /*
     * Initial data
     */
    _dataProcessor = dataProcessor;
    
    _quantityTypeLabel.text = [_dataProcessor getTypeTitle];
    
    [_dataProcessor startUpdatingData];
}


-(void) updateValue:(id)value {
    double finalValue = [value doubleValue];
    
    _amountLeftLabel.text = [NSString stringWithFormat:[_dataProcessor getFormatForDisplay],finalValue,[_dataProcessor getUnitOfMeasurement]];
}

-(void) completedUpdate {
    _amountLeftLabel.text = @"Completed!";
}

-(void) setProgressBarValue:(double) countdownValue {
    //set progress bar
    _progressBar.progress = (countdownValue/[_dataProcessor getMax]) * 1.0;
}
@end

