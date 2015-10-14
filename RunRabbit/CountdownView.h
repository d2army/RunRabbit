//
//  CountdownComponent.h
//  RunRabbit
//
//  Created by Ian Yap on 10/13/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CountdownComponent : UIView

@property (nonatomic) double countdownValue;
@property (nonatomic,strong) NSString *unitOfMeasurement;

- (void) initialize:(double)countdownValue withMeasurementUnit:(NSString *) unitOfMeasurement ;

@end
