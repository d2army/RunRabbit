//
//  NotificationMessage.m
//  RunRabbit
//
//  Created by Ian Yap on 11/3/15.
//  Copyright © 2015 Ian Yap. All rights reserved.
//

#import "NotificationMessage.h"

@implementation NotificationMessage


-(void) updateValue:(id)value {
    struct LocationDataPacket *packet = (struct LocationDataPacket *) packet;
    double finalValue = packet->distanceLeft;
    
    _amountLeftLabel.text = [NSString stringWithFormat:[_dataProcessor getFormatForDisplay],finalValue,[_dataProcessor getUnitOfMeasurement]];
}
@end
