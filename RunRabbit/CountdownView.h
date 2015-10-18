//
//  CountdownView.h
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CountdownView : UIView

@property (strong,nonatomic) IBOutlet UILabel *amountLeftLabel;
@property (strong,nonatomic) IBOutlet UILabel *quantityTypeLabel;
@property (strong,nonatomic) IBOutlet UIProgressView *progressBar;

@property (nonatomic) double countdownValue;
@property (nonatomic,strong) NSString *unitOfMeasurement;
@property (nonatomic,strong) NSTimer *countdownTimer;

- (void) initialize:(double)countdownValue OfType:(NSString *) quantityType  withMeasurementUnit:(NSString *) unitOfMeasurement withX:(NSInteger) xCoord withY:(NSInteger) yCoord ;

@end
