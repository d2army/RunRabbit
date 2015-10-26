//
//  CountdownView.h
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DataUpdaterDelegate.h"
#import "DataProcessorFactory.h"


@interface CountdownView : UIView <DataUpdaterDelegate>

@property (strong,nonatomic) IBOutlet UILabel *amountLeftLabel;
@property (strong,nonatomic) IBOutlet UILabel *quantityTypeLabel;
@property (strong,nonatomic) IBOutlet UIProgressView *progressBar;
@property (nonatomic) double countdownValue;
@property (nonatomic) double countdownMax;
@property (nonatomic,strong) NSString *unitOfMeasurement;


//delegate object to provide info on

- (void) initialize:(double)countdownValue OfType:(DataProcessorType) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger) xCoord withY:(NSInteger) yCoord ;


//Protocol methods to be implemented
-(void) setCountdownValue:(double)countdownValue;
-(void) setPRogressBarValue:(double) countdownValue;

@end
