//
//  CountdownView.h
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DataTargetDelegate.h"
#import "DataProcessorFactory.h"
#import "DataSourceDelegate.h"


@interface CountdownView : UIView <DataTargetDelegate>

@property (strong,nonatomic) IBOutlet UILabel *amountLeftLabel;
@property (strong,nonatomic) IBOutlet UILabel *quantityTypeLabel;
@property (strong,nonatomic) IBOutlet UIProgressView *progressBar;
@property (nonatomic) double countdownValue;
@property (nonatomic) double countdownMax;
@property (nonatomic,strong) NSString *unitOfMeasurement;
@property (nonatomic,strong) id <DataSourceDelegate> dataProcessor;

//delegate object to provide info on

- (void) initialize:(double)countdownValue OfType:(DataProcessorType) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger) xCoord withY:(NSInteger) yCoord ;

- (void) setProgressBarValue:(double)value;

//Protocol methods to be implemented
- (void) updateValue:(id)countdownValue;

@end
